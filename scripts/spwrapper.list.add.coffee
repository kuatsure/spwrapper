spwrapper.list.add = ( settings, callback ) ->
  $().SPServices
    operation: "UpdateListItems"
    async: false
    listName: settings.listName
    updates: settings.batch
    completefunc: (data, status) ->
      if status is "success"
        callback? settings.onSuccess

      else
        callback? settings.onError

      return
