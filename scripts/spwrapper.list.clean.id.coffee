spwrapper.list.clean.id = ( original ) ->
  # original follows this format
  # %7bxxxxxxxx%2Dxxxx%2Dxxxx%2Dxxxx%2Dxxxxxxxxxxxx%7d
  original.replace("%7B", "{").replace("%7D", "}").split("%2D").join "-"
