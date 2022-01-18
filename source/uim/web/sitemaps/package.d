module uim.web.sitemaps;

@safe:
import uim.web;

string siteDateString(SysTime timestamp) {
  string result = timestamp.toISOExtString.split("T")[0];
  return result;
}