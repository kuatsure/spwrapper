spwrapper.list.load = ( settings, callback ) ->
  $().SPServices
    operation: "GetListItems"
    async: false
    webURL: settings.webURL
    listName: settings.listName
    CAMLQuery: settings.query if settings?.query?
    CAMLViewFields: "<ViewFields Properties='True' />"
    completefunc: ( data, status ) ->
      if status is "success"
        callback settings, $(data.responseXML).SPFilterNode( "z:row" )

      else
        callback settings

      return
