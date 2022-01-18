module uim.web.entities;

@safe:
import uim.web;

DOOPEntity[] filterRequest(DOOPEntity[] entities, STRINGAA parameters) {
  if ("filterBy" !in parameters) return entities;
  auto results = entities.dup;

  switch(parameters["filterBy"]) {
    case "createdOn":
      auto filterYear = to!int(parameters.get("filterYear", "0"));         
      if (filterYear > 0) {
        auto startTS = toTimestamp(SysTime(DateTime(filterYear, 1, 1, 0, 0, 5), UTC()));
        auto endTS = toTimestamp(SysTime(DateTime(filterYear, 12, 31, 23, 55, 55), UTC()));
        results = results.filter!(a => ((a.createdOn > startTS) && (a.createdOn < endTS))).array;
      }
      break; 
    case "modifiedOn":
      auto filterYear = to!int(parameters.get("filterYear", "0"));         
      if (filterYear > 0) {
        auto startTS = toTimestamp(SysTime(DateTime(filterYear, 1, 1, 0, 0, 5), UTC()));
        auto endTS = toTimestamp(SysTime(DateTime(filterYear, 12, 31, 23, 55, 55), UTC()));
        results = results.filter!(a => ((a.modifiedOn > startTS) && (a.modifiedOn < endTS))).array;
      }
      break; 
    default: break;
  }
  return results;
}

DOOPEntity[] sortRequest(DOOPEntity[] entities, STRINGAA parameters){
  if ("sortBy" !in parameters) return entities;
  auto results = entities.dup;

  auto sortDir = "up";
  if ("sortDir" in parameters) sortDir = parameters["sortDir"]; 

  const sortBy = parameters["sortBy"];
  switch(sortBy) {
    case "name": 
      if (sortDir == "up") return results.sort!("a.name > b.name").array;
      return results.sort!("b.name > a.name").array;
    case "display": 
      if (sortDir == "up") return results.sort!("a.display > b.display").array;
      return results.sort!("b.display > a.display").array;
    case "mainTitle": 
      if (sortDir == "up") return results.sort!(`a["mainTitle"] > b["mainTitle"]`).array;
      return results.sort!(`a["mainTitle"] < b["mainTitle"]`).array;
    case "subTitle": 
      if (sortDir == "up") return results.sort!("a[`subTitle`] > b[`subTitle`]").array;
      return results.sort!("a[`subTitle`] < b[`subTitle`]").array;
    case "createdOn": 
      if (sortDir == "up") return results.sort!("a.createdOn > b.createdOn").array;
      return results.sort!("b.createdOn > a.createdOn").array;
    case "modifiedOn": 
      if (sortDir == "up") return results.sort!("a.modifiedOn > b.modifiedOn").array;
      return results.sort!("b.modifiedOn > a.modifiedOn").array;
    default: break;
  }
  return results;
}


