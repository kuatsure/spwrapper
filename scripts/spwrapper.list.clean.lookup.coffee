spwrapper.list.clean.lookup = ( original, type ) ->
  if original?
    unless type? or not type is 'string'
      return original.split( ';#' )[1]

    else if type is 'id'
      if original? and original isnt ''
        tempArray = original.split ';#'
        assetItems = []

        for item, i in tempArray by 2
          assetItems.push item

      else
        assetItems = undefined

      return assetItems

    else
      return undefined

  else
    return undefined
