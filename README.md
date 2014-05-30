# spwrapper

> Mild wrapper for SPServices, complete with common helper methods

[![Bower version](https://badge.fury.io/bo/spwrapper.svg)](http://badge.fury.io/bo/spwrapper) [![Code Climate](https://codeclimate.com/github/CreativeElementsGroup/spwrapper.png)](https://codeclimate.com/github/CreativeElementsGroup/spwrapper)

## Installation

Install spwrapper via [bower](http://bower.io)

```bash
$ bower install spwrapper -S
```

## How to Use

Spwrapper is divided into major components of sharepoint. `spwrapper.list` for example. 

### Lists

In its simplest form:

```coffee
  spwrapper.list.load
    listName: listNameVar
  ,
    callBackFunction
```

Feel free to pass any variable or method through `load` and it will pass right through to the call back function.

Need a CAMLQuery?

```coffee
  spwrapper.list.load
    listName:         listNameVar
    query:            spwrapper.helper.queryFormatter [
      type:           'Choice'
      columnHeader:   'active'
      cell:           1
    ]
  ,
    callBackFunction
```

## License

MIT
