module uim.web.queries;

@safe:
import uim.web;

auto toQuery(STRINGAA values, bool starter = false) {
  string[] results;
  foreach(kv; values.byKeyValue) 
    if (kv.value.length > 0) results ~= kv.key~"="~kv.value;
  return (starter ? "?" : "") ~ results.join("&");
}

auto addQuery(string query, STRINGAA values) {
  return (query ? query~"&" : "")~toQuery(values);
}

STRINGAA queryToAA(string query) {
  STRINGAA results;

  foreach(item; query.split("&")) {
    if (item.empty || item.indexOf("=") < 1) continue;

    auto kv = item.split("=");
    results[kv[0]] = kv[1];
  }

  return results;
}

auto filterCriterias(STRINGAA reqParameters) {
  string[] results;

  if (auto filterBy = reqParameters.get("filterBy", null)) 
    results ~= "filterBy="~filterBy.toLower;
  if (auto filterYear = reqParameters.get("filterYear", null)) 
    results ~= "filterYear="~filterYear.toLower;

  return results;
}

auto sortCriterias(STRINGAA reqParameters) {
  string[] results;

  if (auto sortBy = reqParameters.get("sortBy", null)) 
    results ~= "sortBy="~sortBy.toLower;
  if (auto sortDir = reqParameters.get("sortDir", null)) 
    results ~= "sortDir="~sortDir.toLower;

  return results;
}