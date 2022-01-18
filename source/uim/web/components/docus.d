module uim.web.components.docus;

@safe: 
import uim.web; 


/* void addDocuThemes(DAPPApplication app, DAPPPageController[][string] docusThemes) {
  app.pages("documentations", new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": "Dokumentation - UI Manufaktur",
            "pageMainTitle": "Unsere Beiträge aus der UI Manufaktur Redaktion",
            "pageSubTitle": "Viele Themen und viele interessante Ideen sowie Gedanken in unserem Dokumentation",
            "pageCategory": "page",
            "pageKeywords": "",
            "pageTheme": "Dokumentation",
            "pageImage": "/img/docu/docus01.jpg",
            "pageSummary": "",
            "pageContent": ``]);
          } 
          
        override string content(string[string] someParameters = null) {  
          auto theme = this.parameters.get("pageTheme", "");
          auto category = this.parameters.get("pageCategory", "");			
          auto image = this.parameters.get("pageImage", "");	
          auto mainTitle = this.parameters.get("pageMainTitle", "");	
          auto subTitle = this.parameters.get("pageSubTitle", "");	
          auto summary = this.parameters.get("pageSummary", "");
          auto link = categoryToLink(category)~"/"~theme.toLower~"/"~this.name.toLower;	
          string[] kws = this.parameters.get("pageKeywords", "").split("#");
          
          string myContent;
            myContent ~= `<div class="row">`;
            myContent ~= `<div class="col-sm-12 col-md-10 col-lg-8">`;               
            myContent ~= `<h1>Unsere Themen in den Dokumentation</h1>`;
            myContent ~= "</div>";
            myContent ~= "</div>";
            myContent ~= `<div class="row">`;
            myContent ~= `<div class="col-sm-12 col-md-10 col-lg-8">`;               
            myContent ~= docusThemesButtons(docusThemes.getKeys);
            myContent ~= "</div>";
            myContent ~= "</div>";
            myContent ~= "<hr>";
            myContent ~= `<div class="row">`;
            foreach(t, pages; docusThemes) { 
              myContent ~= webEntries(pages);
            }
            myContent ~= "</div>";


            return 
              pageImageHeader("/img/docu/docus01.jpg", "Dokumentation aus der UI Manufaktur Schmiede")~
              BS5Row(["mt-2 row-cards"], 
              H5Div(["main", "main-raised"], 
                BS5Container(H5Div(["section"], 
                  myContent)))).toString;     

      }
    });
    
    foreach(theme, pages; docusThemes)
      addDocuTheme(app, theme, pages);

} 

void addDocuTheme(DAPPApplication app, string theme, DAPPPageController[] pages) {
  app.pages("documentations/"~theme.toLower, new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": "Dokumentation - UI Manufaktur",
            "pageMainTitle": "Unsere Beiträge aus der UI Manufaktur Redaktion",
            "pageSubTitle": "Viele Themen und viele interessante Ideen sowie Gedanken in unserem Dokumentation",
            "pageCategory": "page",
            "pageKeywords": "",
            "pageTheme": theme,
            "pageImage": "/img/docu/docus02.jpg",
            "pageSummary": "",
            "pageContent": ``]);
          } 
          
        override string content(string[string] someParameters = null) {  
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
            pageImageHeader("/img/docu/docus01.jpg", "Dokumentation aus der UI Manufaktur Schmiede")~
            BS5Row(["mt-2 row-cards"], 
              H5Div(["main", "main-raised"], 
                BS5Container(H5Div(["section"], myContent)))).toString;     

      }
    });
} 

string docusThemesButtons(string[] themes) {
  string result;

  foreach(theme; themes.sort) {
    result ~= BS5ButtonLink(["btn-default btn-sm me-1"], ["href":"/documentations/"~theme.toLower], theme).toString;
  }

  return result;
} */