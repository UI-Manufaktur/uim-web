module uim.web;

@safe:
public import std.stdio;
public import std.conv;
public import std.string;
public import std.array;
public import std.algorithm;
public import std.traits;
public import std.datetime;

// libraries
public import uim.core;
public import uim.oop;
public import uim.html;
// public import uim.json;
public import langs.javascript;
public import uim.models;

// public import uim.web.components;
// public import uim.web.entities;
// public import uim.web.queries;
// public import uim.web.sessions;
// public import uim.web.sitemaps;

/* string overviewPage(string[string] parameters, DAPPPageController[] pages) {
  auto myTheme = parameters.get("pageTheme", "");
  auto myCategory = parameters.get("pageCategory", "");			
  auto myImage = parameters.get("pageImage", "");	
  auto myMainTitle = parameters.get("pageMainTitle", "");	
  auto mySubTitle = parameters.get("pageSubTitle", "");	
  auto mySummary = parameters.get("pageSummary", "");
  auto myKeywords = parameters.get("pageKeywords", "");
  auto myLink = "/"~myCategory.toLower~"/"~myTheme.toLower;				

  string inners;

  foreach(page; pages) {
    if (page.name == "index") continue;
    if (page.name == "error") continue;
    
    auto theme = page.parameters.get("pageTheme", "");
    auto category = page.parameters.get("pageCategory", "");			
    auto image = page.parameters.get("pageImage", "");	
    auto mainTitle = page.parameters.get("pageMainTitle", "");	
    auto subTitle = page.parameters.get("pageSubTitle", "");	
    auto summary = page.parameters.get("pageSummary", "");
    auto keywords = page.parameters.get("pageKeywords", "");
    auto link = page.parameters.get("pageLink", "/"~category.toLower~"/"~theme.toLower~"/"~page.name.toLower);				
    
    string keywordsLinks;
    if (keywords.length > 0) { // has keywords
      string[] kws = keywords.split("#");
      foreach(index, kw; kws) {
        if (kw.strip.length == 0) continue; // Empty value

        if (index == 0) {
          keywordsLinks ~= `<a href="`~(kw.toLower == "demos" ?  "/demos" : "/keywords/"~kw)~`" class="badge badge-secondary rounded-left">#`~kw.strip~`</a>`; }
        else {
          keywordsLinks ~= `<a href="`~(kw.toLower == "demos" ?  "/demos" : "/keywords/"~kw)~`" class="badge badge-secondary rounded-0">#`~kw.strip~`</a>`; }
      }
    }
    inners ~= 
      H5Div(["col-sm-6", "col-md-4", "col-lg-3"],          
        BS4Card(["card-plain", "card-blog"],            
          H5Div(["card-header", "card-header-image"],              
            H5A(["href":link],                
              H5Img(["img", "img-raised"],["src":image]))),            
          H5Div(["card-body"],              
            H5H6(["card-category", "text-success"], `<a href="/blogs" class="badge badge-primary me-1">`~category~`</a>`~keywordsLinks),              
            H5H2(["card-title"], H5A(["href":link], mainTitle)),              
            H5H4(["card-title"], H5A(["href":link], subTitle)),              
              H5P(["card-description"],                
                H5String(summary),                
                H5A(["href":link]," Weiterlesen "))))).toString;  
    }

    auto titleArea = (myMainTitle.length > 0) ? H5H2(["title"], myMainTitle).toString : "";
    auto subtitleArea = (mySubTitle.length > 0) ? H5H3(["title"], mySubTitle).toString : "";
    auto summaryArea = (mySummary.length >0) ? H5Div(["card"], H5Div(["card-body"], H5Div(["card-text", "m-2"], ["style":"font-size:1.2em;"], mySummary))).toString : "";

return 
  // pageImageHeader(image, mainTitle, subTitle)~
  BS5Row(["mt-2 row-cards"], 
    H5Div(["main", "main-raised"], 
        BS5Container(
        // dateInfo(created, changed),
        // badges(theme, keywordsLinks),
        H5Div(["section"], BS5Row(inners))).toString
    )).toString;
	

/*     return 
      pageHeader(myImage, myMainTitle, mySubTitle, mySummary)~
      H5Div(["main", "main-raised"], 
          breadcrumbs(["/", "/keywords"], ["UI Manufaktur"], "News")~ 
        BS4Container.row(      
            H5Div(["col-sm-12", "col-md-10", "col-lg-8", "ms-auto", "me-auto", "text-center"],
            titleArea~subtitleArea~summaryArea)).toString~
        BS4Container(H5Div(["section"], 
            BS4Row(inners))).toString
        ).toString; * /
}
    

string pageHeader(string image, string title = null, string subtitle = null, string summary = null) {
  auto titleArea = (title.length > 0) ? H5H2(["title"], title).toString : "";
  auto subtitleArea = (subtitle.length > 0) ? H5H3(["title"], subtitle).toString : "";
  auto summaryArea = (summary.length >0) ? H5Div(["card"], H5Div(["card-body"], H5Div(["card-text", "m-2"], ["style":"font-size:1.2em;"], summary))).toString : "";

  return H5Div(["page-header", "header-filter", "clear-filter"],["style":"height: 30vh; background-image: url('"~image~"');background-repeat:no-repeat;
    background-size:cover;background-position: center;"],  
    BS4Container.row(      
      H5Div(["col-sm-12", "col-md-10", "col-lg-8", "ms-auto", "me-auto", "text-center"]
        /* titleArea~subtitleArea~summaryArea) * /))).toString;
}

auto dateInfo(DAPPPageController page) { return dateInfo(page.created, page.changed); }
auto dateInfo(DateTime created, DateTime changed) {
  return
    H5P(["nowarp mb-0"], 
      H5Small(["text-muted"], 
        H5I(["fas fa-calendar-plus"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Erstellt am"]), 
        H5Time(["datetime":isoDate(created)], " "~germanDate(created)), H5String(" / "),
        H5I(["fas fa-calendar-check"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Letzte Änderung am"]), 
        H5Time(["datetime":isoDate(changed)], " "~germanDate(changed))));      
}

string breadcrumbs(string[] links, string[] titles, string activeTitle) {
  string bcrumbs;
  foreach(index, link; links) bcrumbs ~= BS4BreadcrumbItem.link(["href":link], titles[index]).toString;
  bcrumbs ~= BS4BreadcrumbItem(["active"], activeTitle).toString;  

  return 
    H5Div(["container-fluid mb-3 bg-azure-lt pt-2 pb-3"],   
      BS4Row(
        H5Div(["col-sm-12", "col-md-10", "col-lg-8"],                
          H5Nav(["aria-label":"breadcrumb", "role":"navigation"], 
            H5Ol(["breadcrumb breadcrumb-arrows bg-azure-lt"], ["aria-label":"breadcrumbs", "style":"margin-top:10px;"], bcrumbs))))).toString; 
}

auto badges(string theme, string[] keywords) {
  string badgesLinks;
  if (theme.length > 0) badgesLinks ~= H5A(["badge", "bg-purple","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Thema", "href":"/themes/"~theme.toLower], theme).toString;
  foreach(kw; keywords) {
    auto kword = kw.strip;
    if (kword.length == 0) continue;
    if (kword.strip.toLower == "demos")
      badgesLinks ~= H5A(["badge", "bg-indigo","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Keyword", "href":"/demos"], "#DEMOS").toString;
    else 
      badgesLinks ~= H5A(["badge", "bg-indigo","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Keyword", "href":"/keywords/"~kword.toLower], "#"~kword.strip).toString;
  }
  return H5P(["mt-0"], badgesLinks);
}

auto badges(string category, string theme, string[] keywords) {
  string badgesLinks;
  if (category.length > 0) badgesLinks ~= H5A(["badge", "bg-green","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Kategorie", "href":categoryToLink(category)], category).toString;
  if (theme.length > 0) badgesLinks ~= H5A(["badge", "bg-purple","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Thema", "href":"/themes/"~theme.toLower], theme).toString;
  //badgesLinks ~= "<br>";
  foreach(kw; keywords) {
    auto kword = kw.strip;
    if (kword.strip.length == 0) continue;
    if (kword.strip.toLower == "demos")
      badgesLinks ~= H5A(["badge", "bg-indigo","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Keyword", "href":"/demos"], "#DEMOS").toString;
    else 
      badgesLinks ~= H5A(["badge", "bg-indigo","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Keyword", "href":"/keywords/"~kword.toLower], "#"~kword.strip).toString;
  }
  return H5P(["mt-0"], badgesLinks);
}

auto badges(string category, string theme, string keywordNames, STRINGAA themes, STRINGAA keywords = null) {
  string badgesLinks;
  if (category.length > 0) badgesLinks ~= H5A(["badge", "bg-green","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Kategorie", "href":categoryToLink(category)], category).toString;
  if (theme.length > 0) {
    if (theme in themes) badgesLinks ~= H5A(["badge", "bg-purple","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Thema", "href":"/themes/"~theme.toLower], themes[theme]).toString;
    else badgesLinks ~= H5A(["badge", "bg-purple","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Thema", "href":"/themes/"~theme.toLower], theme.capitalize).toString;
  }
  //badgesLinks ~= "<br>";
  foreach(kw; keywordNames.split("#")) {
    auto keyword = kw.strip;
    if (keyword.length == 0) continue;

    if (keyword in keywords)
      badgesLinks ~= H5A(["badge", "bg-indigo","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Keyword", "href":"/keywords/"~keyword.toLower], "#"~keywords[keyword]).toString;
    else
      badgesLinks ~= H5A(["badge", "bg-indigo","me-1"], ["data-toggle":"tooltip", "data-placement":"top", "title":"Keyword", "href":"/keywords/"~keyword.toLower], "#"~keyword.capitalize).toString;
  }
  return H5P(["mt-0"], badgesLinks);
}


auto categoryToLink(string category) {
  switch(category.toLower) {
    case "blog": return "/blogs";
    case "demo":  return "/demos";
    case "dokumentation":  return "/documentations";
    case "news":  return "/news";
    case "tutorial":  return "/tutorials";
    default:  return "/"~category.toLower;
  }
}

auto categoryToRoute(string category) {
  switch(category.toLower) {
    case "blog": return "blogs";
    case "dokumentation":  return "documentations";
    case "news":  return "news";
    case "tutorial":  return "tutorials";
    default:  return category.toLower;
  }
}

string pageImageHeader(string image = null, string title = null, string subtitle = null) {
    if (image.length == 0) return "";
    return
    `<div style="height: 30vh; background-image: url('`~image~`');background-repeat:no-repeat;background-size:cover;background-position: center;">
        <div class="container">
            <div class="row">
                <div class="col-12 pt-5 pb-2" style="background-color:rgba(0, 0, 0, 0.5);">
                    <h1 class="me-auto ms-auto text-center text-white" style="font-size:3rem;">`~title~`</h1>
                    <h2 class="me-auto ms-auto text-center text-white d-none d-md-block" style="font-size:2rem;">`~subtitle~`</h2>
                </div>
            </div>
        </div>
    </div>`; 

}

 */

 void canonical(HTTPServerRequest request, STRINGAA parameters) {
  parameters["link"] = parameters.get("link", "")~
    `<link rel="canonical" href="https://ui-manufaktur.com%s" />`.format(request.requestPath);
}


