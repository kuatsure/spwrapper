var spwrapper;

spwrapper = {};

spwrapper.list = {};

spwrapper.list.clean = {};

spwrapper.helper = {};

spwrapper.helper.batchFormatter = function(batchArray, type) {
  var a, batchString, cmd, i, m, _i, _j, _len, _len1;
  batchString = '<Batch OnError="Continue" PreCalc="TRUE">';
  if ((type != null) && type === 'new') {
    cmd = ' Cmd="New"';
  } else {
    cmd = ' Cmd="Update"';
  }
  for (i = _i = 0, _len = batchArray.length; _i < _len; i = ++_i) {
    m = batchArray[i];
    batchString += "<Method ID=\"" + (i + 1) + "\"" + cmd + ">";
    for (_j = 0, _len1 = m.length; _j < _len1; _j++) {
      a = m[_j];
      batchString += "<Field Name=\"" + a.columnHeader + "\">" + a.value + "</Field>";
    }
    batchString += '</Method>';
  }
  batchString += '</Batch>';
  return batchString;
};

spwrapper.helper.queryFormatter = function(queryArray) {
  var queryItem, queryString, _i, _len;
  queryString = '<Query>';
  for (_i = 0, _len = queryArray.length; _i < _len; _i++) {
    queryItem = queryArray[_i];
    queryString += "<Where><Eq><FieldRef Name='" + queryItem.columnHeader + "' /><Value Type='" + queryItem.type + "'>" + queryItem.cell + "</Value></Eq></Where>";
  }
  queryString += '</Query>';
  return queryString;
};

spwrapper.list.clean.id = function(original) {
  return original.replace("%7B", "{").replace("%7D", "}").split("%2D").join("-");
};

spwrapper.list.clean.lookup = function(original, type) {
  var assetItems, i, item, tempArray, _i, _len;
  if (original != null) {
    if (!((type != null) || !type === 'string')) {
      return original.split(';#')[1];
    } else if (type === 'id') {
      if ((original != null) && original !== '') {
        tempArray = original.split(';#');
        assetItems = [];
        for (i = _i = 0, _len = tempArray.length; _i < _len; i = _i += 2) {
          item = tempArray[i];
          assetItems.push(item);
        }
      } else {
        assetItems = void 0;
      }
      return assetItems;
    } else {
      return void 0;
    }
  } else {
    return void 0;
  }
};

spwrapper.list.load = function(settings, callback) {
  return $().SPServices({
    operation: "GetListItems",
    async: false,
    webURL: settings.webURL,
    listName: settings.listName,
    CAMLQuery: (settings != null ? settings.query : void 0) != null ? settings.query : void 0,
    CAMLViewFields: "<ViewFields Properties='True' />",
    completefunc: function(data, status) {
      if (status === "success") {
        callback(settings, $(data.responseXML).SPFilterNode("z:row"));
      } else {
        callback(settings);
      }
    }
  });
};

spwrapper.list.update = function(settings, callback) {
  return $().SPServices({
    operation: "UpdateListItems",
    async: false,
    listName: settings.listName,
    updates: settings.batch,
    completefunc: function(data, status) {
      if (status === "success") {
        if (typeof callback === "function") {
          callback(settings.onSuccess);
        }
      } else {
        if (typeof callback === "function") {
          callback(settings.onError);
        }
      }
    }
  });
};
