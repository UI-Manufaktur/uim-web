  module uim.web.components.themes;

  @safe: 
  import uim.web; 

/* 
  void addThemesPages(DAPPApplication app, DAPPPageController[][string] themePages) {
    app.pages("themesx", new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": "Themes - UI Manufaktur",
            "pageMainTitle": "Wer sucht, der findet",
            "pageSubTitle": "Unsere Keywords",
            "pageCategory": "page",
            "pageKeywords": "",
            "pageTheme": "Themes",
            "pageImage": "/img/themes.jpg",
            "pageSummary": "",
            "pageContent": ``]);
          } 
          
        override string content(string[string] someParameters = null) {  
          string inners;

          inners ~= themesButtons(themePages.getKeys);

          return 
            pageImageHeader("/img/bg10.jpg", "Themen der UI Manufaktur Schmiede")~
            BS5Row(["mt-2 row-cards"], 
              H5Div(["main", "main-raised"], 
                BS5Container(H5Div(["section"], BS5Row(inners))))).toString;     
    }});
    
    foreach(theme, pages; themePages)
      addThemePages(app, theme, pages);
  }

  void addThemesPages(DAPPApplication app, string pageLink, string category, string title, DAPPPageController[][string] themePages) {
    app.pages(pageLink, new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": category~" - UI Manufaktur",
            "pageMainTitle": "Wer sucht, der findet",
            "pageSubTitle": "Unsere Keywords",
            "pageCategory": "page",
            "pageKeywords": "",
            "pageTheme": category,
            "pageImage": "/img/themes.jpg",
            "pageSummary": "",
            "pageContent": ``]);
          } 
          
        override string content(string[string] someParameters = null) {  
          string inners;
          inners ~= themesButtons(themePages.getKeys);

          return 
            pageImageHeader("/img/bg10.jpg", "Themen aus der UI Manufaktur Schmiede")~
            BS5Row(["mt-2 row-cards"], 
              H5Div(["main", "main-raised"], 
                BS5Container(H5Div(["section"], BS5Row(inners))))).toString;     
    }});
    
    foreach(theme, pages; themePages)
      addThemePages(app, theme, pages);
  }

  void addThemePages(DAPPApplication app, string theme, DAPPPageController[] pages) {
    app.pages("themes/"~theme.toLower, new class DAPPPageController {
      this() { 
        super(); 
        this
        .created(DateTime(2017, 5, 2, 10, 10, 0))
        .changed(timeLastModified(__FILE_FULL_PATH__))
        .parameters([
            "pageTitle": "Themes - Manufaktur",
            "pageMainTitle": "Wer sucht, der findet",
            "pageSubTitle": "Gefundene Seiten zum Stichwort "~theme,
            "pageCategory": "page",
            "pageKeywords": "#"~theme,
            "pageTheme": "Keywords",
            "pageImage": "/img/themes.jpg",
            "pageSummary": "",
            "pageContent": ``]);
          } 
          
        override string content(string[string] someParameters = null) {  
          string inners;

          foreach(page; pages) {
            if (page.name == "index") continue;
            if (page.name == "error") continue;
            
            inners ~= webEntry(page); 
        }

        return 
          webPageFrame(this, ["/", "/themes"], ["UI Manufaktur", "Themen"], theme,
            webRowMinimal(inners));
    }});
  }


  string themesButtons(string[] themes) {
    string result;

    foreach(theme; themes.sort) {
      result ~= BS5ButtonLink(["btn-default btn-sm me-1"], ["href":"/themes/"~theme.toLower], theme).toString;
    }

    return result;
  }
 */