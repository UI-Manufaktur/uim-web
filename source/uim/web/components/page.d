module uim.web.components.page;

@safe:
import uim.web;

/* string webPage(DAPPPageController page, string additionalContent = null) {
  auto created = page.created;
  auto changed = page.changed;
  auto theme = page.parameters.get("pageTheme", "");
  auto category = page.parameters.get("pageCategory", "");			
  auto image = page.parameters.get("pageImage", "");	
  auto title = page.parameters.get("pageTitle", "");	
  auto mainTitle = page.parameters.get("pageMainTitle", "");	
  auto subTitle = page.parameters.get("pageSubTitle", "");	
  auto summary = page.parameters.get("pageSummary", "");
  auto keywords = page.parameters.get("pageKeywords", "").split("#");
  auto content = page.parameters.get("pageContent", "") ~ additionalContent;	

  return 
    pageImageHeader(image, mainTitle, subTitle)~
    BS5Row(["mt-2 row-cards"],
      H5Div(["main", "main-raised"], 
        BS5Container(
          BS5Row(["row-cards"],
            (summary.length > 0 ? 
          `<div class="col-12"><div class="card mb-2">
                        <div class="card-body">
                          <h3 class="card-title">`~summary.replace("\\n", " ")~`</h3>
      </div></div></div>` : "")),
          BS5Row(["row-cards"],
            BS5Col(["col-sm-12", "col-md-8", "col-lg-10", "ml-auto", "mr-auto"], 
              dateInfo(created, changed)~
              badges(category, theme, keywords)~            
              content
            ))).toString
    )).toString;
}

string webRow(DAPPPageController page, string additionalContent = null) {
  auto created = page.created;
  auto changed = page.changed;
  auto theme = page.parameters.get("pageTheme", "");
  auto category = page.parameters.get("pageCategory", "");			
  auto keywords = page.parameters.get("pageKeywords", "").split("#");
  auto content = page.parameters.get("pageContent", "") ~ additionalContent;	

  return
    webRowMinimal(
      dateInfo(created, changed)~
      badges(category, theme, keywords)~
      content);
}

string webRowMinimal(DAPPPageController page, string content) {
  return BS5Row(
    BS5Col(["col-sm-12", "col-md-8", "col-lg-10", "ml-auto", "mr-auto"], 
      content)).toString;
}
string webRowMinimal(string content) {
  return BS5Row(["row-cards"],
    BS5Col(["col-sm-12", "col-md-8", "col-lg-10", "ml-auto", "mr-auto"], 
      content)).toString;
}

string webPageFrame(DAPPPageController page, string[] bcLinks, string[] bcTitles, string activeBc, string additionalContent) {
  auto image = page.parameters.get("pageImage", "");	
  auto mainTitle = page.parameters.get("pageMainTitle", "");	
  auto subTitle = page.parameters.get("pageSubTitle", "");	
  auto summary = page.parameters.get("pageSummary", "");
  auto content = page.parameters.get("pageContent", "") ~ additionalContent;
  auto theme = page.parameters.get("pageTheme", "");
  auto category = page.parameters.get("pageCategory", "");			
  auto keywords = page.parameters.get("pageKeywords", "").split("#");

			return 
  pageImageHeader(image, mainTitle, subTitle)~
  BS5Row(["mt-2 row-cards"], 
    H5Div(["main", "main-raised"], 
        BS5Container(
          H5Div(["section"], BS5Row(["row-cards"], additionalContent))).toString
    )).toString;

}
 */