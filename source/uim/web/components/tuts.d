module uim.web.components.tuts;

@safe: 
import uim.web;

/* void addTutsThemes(DAPPApplication app, DAPPPageController[][string] pages) {
/*   foreach(page; pages) {
    if (page.name == "index") continue;
    if (page.name == "error") continue;
    
    auto theme = page.parameters.get("pageTheme", "");
    auto category = page.parameters.get("pageCategory", "");			
    auto link = categoryToLink(category)~"/"~theme.toLower~"/"~page.name.toLower;	

    app.pages(link[1..$], page);
  } * /

  app.pages("tutorials", new class DAPPPageController {
		this() { 
      super(); 
      this
      .created(DateTime(2017, 5, 2, 10, 10, 0))
      .changed(timeLastModified(__FILE_FULL_PATH__))
      .parameters([
          "pageTitle": "Keywords - Manufaktur",
          "pageMainTitle": "Wer sucht, der findet",
          "pageSubTitle": "Gefundene Seiten zum Stichwort ",
          "pageCategory": "page",
          "pageKeywords": "#",
          "pageTheme": "Keywords",
          "pageImage": "/img/docu/tuts02.jpg",
          "pageSummary": "",
          "pageContent": ``]);
        } 
				
      override string content(STRINGAA someParameters = null) {  
        string myContent;
        myContent ~= BS5Row(
                      H5Div(["col-sm-12", "col-md-8", "col-lg-10"], 
                        H5H1("Tutorials zu den Themen"))).toString;
        myContent ~= BS5Row(
                      H5Div(["col-sm-12", "col-md-8", "col-lg-10"], 
                        tutsThemeButtons(pages.getKeys))).toString;
        myContent ~= "<hr>";
        myContent ~= `<div class="row">`;
        foreach(t, p; pages) { 
          myContent ~= webEntries(p);
        }
        myContent ~= "</div>";

        return 
          pageImageHeader("/img/docu/tuts01.jpg", "Tutorials aus der UI Manufaktur Schmiede")~
          BS5Row(["mt-2 row-cards"], 
            H5Div(["main", "main-raised"], 
              BS5Container(H5Div(["section"], myContent)))).toString;       
	}});

  foreach(t, p; pages)
      addTutsTheme(app, t, p);

} 

void addTutsTheme(DAPPApplication app, string theme, DAPPPageController[] pages) {
  app.pages("tutorials/"~theme.toLower, new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": "Blogs - UI Manufaktur",
            "pageMainTitle": "Unsere Beiträge aus der UI Manufaktur Redaktion",
            "pageSubTitle": "Viele Themen und viele interessante Ideen sowie Gedanken in unserem Blog",
            "pageCategory": "page",
            "pageKeywords": "",
            "pageTheme": theme,
            "pageImage": "/img/docu/tuts02.jpg",
            "pageSummary": "",
            "pageContent": ``]);
          } 
          
        override string content(STRINGAA someParameters = null) {  
          auto theme = this.parameters.get("pageTheme", "");
          auto category = this.parameters.get("pageCategory", "");			
          auto image = this.parameters.get("pageImage", "");	
          auto mainTitle = this.parameters.get("pageMainTitle", "");	
          auto subTitle = this.parameters.get("pageSubTitle", "");	
          auto summary = this.parameters.get("pageSummary", "");
          auto link = categoryToLink(category)~"/"~theme.toLower~"/"~this.name.toLower;	
          string[] kws = this.parameters.get("pageKeywords", "").split("#");
          
          string myContent = BS5Row(webEntries(pages)).toString;

          return 
            pageImageHeader("/img/docu/tuts02.jpg", "Tutorials zum Thema "~theme)~
            H5Div(["main", "main-raised"], 
              BS5Container(H5Div(["section"], 
                myContent)).toString
            ).toString;     
      }
    });
} 

string tutsThemeButtons(string[] themes) {
  string result;

  foreach(theme; themes.sort) {
    result ~= BS5ButtonLink(["btn-default btn-sm me-1"], ["href":"/tutorials/"~theme.toLower], theme).toString;
  }

  return result;
} */