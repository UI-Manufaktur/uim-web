module uim.web.sessions;

@safe:
import uim.web;

auto add(Session session, STRINGAA values) {
  if (session)
    foreach(kv; values.byKeyValue) session.set(kv.key, kv.value);
  return session;
}

auto removeKeys(Session session, string[] keys...) {
  return removeKeys(session, keys);
}
auto removeKeys(Session session, string[] keys) {
  foreach(key; keys) session.remove(key);
  return session;
}

auto removeValues(Session session, string[] values...) {
  return removeKeys(session, values);
}
auto removeValues(Session session, string[] values) {
  foreach(value; values) session.remove(value);
  return session;
}

auto sessionKeys(Session session) {
  string[] results;
  session.opApply((key) @safe { results ~= key; return 0; });
  return results; 
}
unittest {
  /// TODO
}
