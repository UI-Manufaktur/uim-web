module uim.web.components.news  ;

@safe: 
import uim.web;

/* void addNewsThemes(DAPPApplication app, DAPPPageController[][string] newsThemes) {
  app.pages("news", new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": "News - UI Manufaktur",
            "pageMainTitle": "Unsere Beiträge aus der UI Manufaktur Redaktion",
            "pageSubTitle": "Viele Themen und viele interessante Ideen sowie Gedanken in unserem News",
            "pageCategory": "page",
            "pageKeywords": "",
            "pageTheme": "News",
            "pageImage": "/img/docu/news01.jpg",
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
          
          string myContent;
            myContent ~= BS5Row.col(["col-sm-12 col-md-10 col-lg-8"], H5H1("Unsere Themen in den News")).toString;
            myContent ~= BS5Row.col(["col-sm-12 col-md-10 col-lg-8"], newsThemesButtons(newsThemes.getKeys)).toString;

            myContent ~= "<hr>";
            //myContent ~= BS5Row(newsThemes.map!(a => webEntries(a)).array.join).toString;


            return 
              pageImageHeader("/img/docu/news01.jpg", "News aus der UI Manufaktur Schmiede")~
  BS5Row(["mt-2 row-cards"], 
    H5Div(["main", "main-raised"], 
      BS5Container(H5Div(["section"], myContent)))).toString;     

      }
    });
    
    newsThemes.byKeyValue.each!(themePage => addNewsTheme(app, themePage.theme, themePage.page));

} 

void addNewsTheme(DAPPApplication app, string theme, DAPPPageController[] pages) {
  app.pages("news/"~theme.toLower, new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": "News - UI Manufaktur",
            "pageMainTitle": "Unsere Beiträge aus der UI Manufaktur Redaktion",
            "pageSubTitle": "Viele Themen und viele interessante Ideen sowie Gedanken in unserem News",
            "pageCategory": "page",
            "pageKeywords": "",
            "pageTheme": theme,
            "pageImage": "/img/docu/news02.jpg",
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
            pageImageHeader("/img/docu/news01.jpg", "News aus der UI Manufaktur Schmiede")~
            BS5Row(["mt-2 row-cards"], 
              H5Div(["main", "main-raised"], 
                BS5Container(H5Div(["section"], myContent)))).toString;     

      }
    });
} 

string newsThemesButtons(string[] themes) {
  return themes
    .sort
    .map!(t => BS5ButtonLink(["btn-default btn-sm me-1"], ["href":"/news/"~t.toLower], t).toString)
    .join;
  }
} */