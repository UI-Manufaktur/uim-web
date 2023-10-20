module uim.web.components.code;

@safe: 
import uim.web;

class DCodeEntry {
  this() {}

  mixin(OProperty!("string", "name"));
  mixin(OProperty!("string", "uda"));
  mixin(OProperty!("string", "title"));
  mixin(OProperty!("string", "description"));
  mixin(OProperty!("string[]", "inputs"));
  mixin(OProperty!("string[]", "outputs"));
  mixin(OProperty!("string[string]", "examples"));
  mixin(OProperty!("string[]", "remarks"));

  override string toString() {
    string result;

    result ~= H5P(H5A(["id":this.name, "name":this.name])).toString;
    result ~= `<hr /><p>&nbsp;</p>`;
    result ~= H5H2(
      this.uda 
        ? H5Small(this.uda).toString
        :"",
      title).toString;
      
    result ~= H5P(description).toString;
    if (this.inputs) {
      result ~= H5H3("Eingabe").toString;

      string inners = inputs
        .map!(i => H5Li(i).toString)
        .join;
        
      result ~= H5Ul(inners).toString;
    }
    if (this.outputs) {
      result ~= H5H3("Ausgabe").toString;

      string inners = outputs.map!(o = > H5Li(o).toString).join();
      result ~= H5Ul(inners).toString;
    }
    if (this.examples) {
      result ~= H5H3("Beispiele").toString;

      string[] inners;
      foreach(example, output; examples) inners ~= H5Li(H5Code(example), H5String(" "), FAS("hand-point-right"), H5String(" "), H5Code(output)).toString;
      result ~= H5Ul(inners.join()).toString;
    }
    if (this.remarks) {
      result ~= H5H3("Anmerkungen").toString;

      string[] inners;
      foreach(remark; remarks) inners ~= H5Li(remark).toString;
      result ~= H5Ul(inners.join()).toString;
    }
    result ~= `<p>&nbsp;</p>
<p><a class="btn btn-secondary border border-dark" href="#overview">&nbsp;Zur&uuml;ck zur &Uuml;bersicht</a></p>`;

    return result;
  }
}
auto CodeEntry() { return new DCodeEntry; }

class DCodeOverview {
  this() {}

  mixin(OProperty!("string", "title"));
  mixin(OProperty!("string", "release"));
  mixin(OProperty!("string", "description"));
  mixin(OProperty!("DCodeEntry[]", "entries"));
  mixin(OProperty!("string[]", "remarks")); 
  mixin(OProperty!("string[]", "imports")); 

  override string toString() {
    string results;

    results ~= H5H1(this.title).toString;
    results ~= (this.release) ? H5H3("Release").toString~H5P(this.release).toString : "";
    results ~= (this.description) ? H5H3("Beschreibung").toString~H5P(this.description).toString : "";
    if (this.imports) {
      results ~= H5H3("Imports").toString;

      string[] inners;
      foreach(imp; imports) inners ~= H5Li(imp).toString;
      results ~= H5Ul(inners.join()).toString;
    }
    if (this.remarks) {
      results ~= H5H3("Anmerkungen").toString;

      string[] inners;
      foreach(remark; remarks) inners ~= H5Li(remark).toString;
      results ~= H5Ul(inners.join()).toString;
    }
    results ~= `<p><a id="overview" name="overview"></a></p><hr /><p>&nbsp;</p>`;
    results ~= `<h2>&Uuml;bersicht</h2>`;
    if (this.entries) {
      string inners;

      foreach(entry; entries) inners ~= H5Li(H5A(["href":"#"~entry.name], entry.title)).toString;
      results ~= H5P("Folgende Funktionen stehen zur Verf&uuml;gung.").toString;
      results ~= H5Ul(inners).toString;
      foreach(entry; entries) results ~= entry.toString;
    }

    return results;
  }
}
auto CodeOverview() { return new DCodeOverview(); }