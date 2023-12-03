module uim.web.components.blogs;

@safe: 
import uim.web;


/* string blogsIndex(DAPPApplication app) {
  return blogsIndex(app.pages, app);
}

string blogsIndex(DAPPPageController[string] pages, DAPPApplication app) {
  string inners;
  string blogImage;
  string blogTitle;
  string blogSubtitle;
  string blogSummary;

  foreach(name, page; pages) {
    if (page.name == "error") continue; 
    if (page.name == "index") continue;

    auto theme = page.parameters.get("pageTheme", "");
    auto category = page.parameters.get("pageCategory", "");			
    auto keywords = page.parameters.get("pageKeywords", "").split("#");

    auto image = page.parameters.get("pageImage", "");	
    auto title = page.parameters.get("pageTitle", "");	
    auto mainTitle = page.parameters.get("pageMainTitle", "");	
    auto subTitle = page.parameters.get("pageSubTitle", "");	
    auto summary = page.parameters.get("pageSummary", "");
    auto link = categoryToLink(category)~"/"~theme.toLower~"/"~page.name.toLower;	

    inners ~= BS5Card
    .image(["img-fluid"], ["src":image, "alt":title])
    .body_(
      H5A(["btn btn-outline-success btn-block btn-sm rounded-0"], ["href":link], capitalize(category)),
      badges(category, theme, keywords),
      H5H4(["card-title mt-2"], mainTitle),
      H5H5(["card-title"], subTitle),
      H5P(["card-text"], summary),
      H5A(["btn btn-primary"], ["href":link], `Weiterlesen`))
    .footer(dateInfo(page.created, page.changed))
    .toString;      
  }

  auto appTheme = ("theme" in app.parameters) ? app.parameters["theme"] : "";
  return 
  H5Div(["content-wrapper"],
    BS5Container(
    H5Img(["img-fluid w-100 mb-3 img-thumbnail shadow-sm rounded-0"], ["src":"/img/docu/"~appTheme~"/main.jpg", "alt":""]), 
    H5H2(["h4  text-center"], blogTitle),
    H5P(["text-center"], blogSubtitle),
    H5P(["text-muted font-italic text-justify"], blogSummary),
    H5Div(["card-columns"], inners))).toString;
}
/* 
string blogs(DAPPPageController[] pages, DAPPApplication app) {
  string inners;
  string blogImage;
  string blogTitle;
  string blogSubtitle;
  string blogSummary;

  foreach(page; pages) {
    if (page.name == "error") continue; 

    if (page.name == "index") {
      if ("pageImage" in page.parameters) blogImage = page.parameters["pageImage"];
      if ("pageMainTitle" in page.parameters) blogTitle = page.parameters["pageMainTitle"];
      if ("pageSubTitle" in page.parameters) blogSubtitle = page.parameters["pageSubTitle"];
      if ("pageSummary" in page.parameters) blogSummary = page.parameters["pageSummary"];
      continue;
    } 

    auto buttons = BS5ButtonGroup(["btn-group-sm d-flex"]);
    foreach(kw; page.parameters["pageKeywords"].split("#")) {
      auto keyword = kw.strip;
      if (kw.length == 0) continue;

      buttons(H5A(["btn btn-info btn-sm rounded-0"], ["href":app.rootPath~"keywords/"~keyword], capitalize(keyword)));
    }

    auto pageImage = ("pageImage" in page.parameters) ? page.parameters["pageImage"] : "";
    auto pageTitle = ("pageTitle" in page.parameters) ? page.parameters["pageTitle"] : "";
    auto pageMainTitle = ("pageMainTitle" in page.parameters) ? page.parameters["pageMainTitle"] : "";
    auto pageSubTitle = ("pageSubTitle" in page.parameters) ? page.parameters["pageSubTitle"] : "";
    auto pageSummary = ("pageSummary" in page.parameters) ? page.parameters["pageSummary"] : "";
    auto pageCategory = ("pageCategory" in page.parameters) ? page.parameters["pageCategory"] : "";

    inners ~= BS5Card
    .image(["img-fluid"], ["src":pageImage, "alt":pageTitle])
    .body_(
      H5A(["btn btn-outline-success btn-block btn-sm rounded-0"], ["href":app.rootPath~pageCategory], capitalize(pageCategory)),
      buttons,
      H5H4(["card-title mt-2"], pageMainTitle),
      H5H5(["card-title"], pageSubTitle),
      H5P(["card-text"], pageSummary),
      H5A(["btn btn-primary"], ["href":page.path], `Zum Artikel <i class="fas fa-arrow-circle-right"></i>`))
    .footer(
      H5P(["card-text mx-auto"], 
        H5Small(["text-muted"], `Erstellt `~germanDate(page.created)), 
        H5Small(["text-muted"], ` - Geändert `~germanDate(page.changed))))
    .toString;      
  }
  return inners;
} * /

void addBlogThemes(DAPPApplication app, DAPPPageController[][string] blogThemes) {
  app.pages("blogsx", new class DAPPPageController {
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
            "pageTheme": "Blogs",
            "pageImage": "/img/docu/blog01.jpg",
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
          
          return 
            pageImageHeader("/img/docu/blog01.jpg", "Blogs aus der UI Manufaktur Schmiede")~
            H5Div(["main", "main-raised"], 
              BS5Container(H5Div(["section"], 
                BS5Row(["mt-2 row row-cards"], 
                  BS5Col(["col-sm-12 col-md-10 col-lg-8"], 
                    H5H1("Unsere Themen in den Blogs"))).toString~
                BS5Row(["row-cards"], 
                  BS5Col(["col-sm-12 col-md-10 col-lg-8"], themesButtons(blogThemes.getKeys))).toString~
                "<hr>"
                // BS5Row(blogThemes.map!(a => webEntries(a)).array.join).toString
                ))).toString;     

      }
    });
    
    foreach(theme, pages; blogThemes)
      addBlogTheme(app, theme, pages);

} 

void addBlogTheme(DAPPApplication app, string theme, DAPPPageController[] pages) {
  app.pages("blogs/"~theme.toLower, new class DAPPPageController {
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
            "pageImage": "/img/docu/blogs02.jpg",
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
          
          string myContent = BS5Row(["row-cards"], webEntries(pages)).toString;

          return 
            pageImageHeader("/img/docu/blog01.jpg", "Blogs aus der UI Manufaktur Schmiede")~
            BS5Row(["mt-2 row-cards"], 
              H5Div(["main", "main-raised"], 
              BS5Container(
                H5Div(["section"], myContent)))).toString;

      }
    });
} 

string themesButtons(string[] themes) {
  string result;

  foreach(theme; themes.sort) {
    result ~= BS5ButtonLink(["btn-default btn-sm me-1"], ["href":"/blogs/"~theme.toLower], theme).toString;
  }

  return result;
}
 */