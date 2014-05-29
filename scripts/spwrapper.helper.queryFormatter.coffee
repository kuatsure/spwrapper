spwrapper.helper.queryFormatter = ( queryArray ) ->
  queryString = '<Query>'

  for queryItem in queryArray
    queryString += "<Where><Eq><FieldRef Name='#{queryItem.columnHeader}' /><Value Type='#{queryItem.type}'>#{queryItem.cell}</Value></Eq></Where>"

  queryString += '</Query>'

  return queryString
