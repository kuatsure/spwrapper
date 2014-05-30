spwrapper.helper.batchFormatter = ( batchArray ) ->
  batchString = '<Batch OnError="Continue" PreCalc="TRUE">'

  for b, i in batchArray
    batchString += """<Method ID="#{i + 1}" Cmd="New">
      <Field Name="#{b.columnHeader}">#{b.value}</Field>
    </Method>"""

  batchString += '</Batch>'

  return batchString
