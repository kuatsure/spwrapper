spwrapper.helper.batchFormatter = ( batchArray, type ) ->
  batchString = '<Batch OnError="Continue" PreCalc="TRUE">'
  if type? and type is 'new' then cmd = ' Cmd="New"' else cmd = ' Cmd="Update"'

  for m, i in batchArray
    batchString += """<Method ID="#{i + 1}"#{cmd}>"""

    for a in m
      batchString += """<Field Name="#{a.columnHeader}">#{a.value}</Field>"""

    batchString += '</Method>'

  batchString += '</Batch>'

  return batchString
