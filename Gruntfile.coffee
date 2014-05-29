# Generated on 2014-05-29 using
# generator-mote 0.1.0

module.exports = ( grunt ) ->
  # show elapsed time at the end
  require( 'time-grunt' ) grunt
  # load all grunt tasks
  require( 'load-grunt-tasks' ) grunt

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    bower: grunt.file.readJSON 'bower.json'

    config:
      app:      '.'
      dist:     '.'

    watch:
      gruntfile:
        files: [ 'Gruntfile.coffee' ]

      scripts:
        files: [ '<%= config.app %>/scripts/**/*' ]
        tasks: [
          'coffeelint'
          'coffee'
          'replace:scripts'
        ]

    clean:
      all:
        src: '<%= config.dist %>/*.{js}'

    coffeelint:
      options:
        'max_line_length':
          'level': 'ignore'
        'no_empty_param_list':
          'level': 'error'
      files: [ '<%= config.app %>/scripts/*.coffee' ]

    coffee:
      options:
        bare: true
      jitter:
        files:
          '<%= config.dist %>/<%= pkg.name %>.js': [ '<%= config.app %>/scripts/*.coffee' ]

    replace:
      options:
        patterns: [
          match: 'NAME'
          replacement: '<%= pkg.name %>'
        ,
          match: 'VERSION',
          replacement: '<%= pkg.version %>'
        ,
          match: 'DATE'
          replacement: '<%= grunt.template.today(\'yyyy-mm-dd\') %>'
        ,
          match: 'YEAR'
          replacement: '<%= grunt.template.today(\'yyyy\') %>'
        ]
      scripts:
        files: [
          expand: true
          flatten: true
          src: [ '<%= config.dist %>/<%= pkg.name %>.js' ]
          dest: '<%= config.dist %>'
        ]

    bump:
      options:
        updateConfigs: [ 'pkg' ]
        pushTo: 'origin'
        files: [
          'package.json'
          'bower.json'
        ]
        commitFiles: [
          'package.json'
          'bower.json'
          '<%= config.dist %>/<%= pkg.name %>.js'
        ]

  grunt.registerTask 'default', [
    'clean'
    'coffeelint'
    'coffee'
    'replace'
  ]

  grunt.registerTask 'ship', 'Version bumps spwrapper, commits, tags then pushes to origin', ( version ) ->
    version ?= 'patch'

    grunt.task.run [
      "bump-only:#{version}"
      'coffee'
      'replace'
      'bump-commit'
    ]
