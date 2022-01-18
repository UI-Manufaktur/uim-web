module uim.web.components.entry;

@safe:
import uim.web;


/* string webEntries(DAPPPageController[] pages) {
  string result;

  foreach(page; pages) result ~= webEntry(page);
  
  return result;
}

string webEntry(DAPPPageController page) {
  if (!page) return "";

    auto theme = page.parameters.get("pageTheme", "");
    auto category = page.parameters.get("pageCategory", "");			
    auto keywords = page.parameters.get("pageKeywords", "").split("#");
  auto image = page.parameters.get("pageImage", "");	
  auto mainTitle = page.parameters.get("pageMainTitle", "");	
  auto subTitle = page.parameters.get("pageSubTitle", "");
  auto summary = page.parameters.get("pageSummary", "");
  auto link = page.parameters.get("pageLink", categoryToLink(category)~"/"~theme.toLower~"/"~page.name.toLower);				

  return 
    BS5Col(["col-sm-6 col-lg-4"], 
      BS5Card(["mb-2"])
        .image(["img-responsive img-responsive-16by9"], ["style":"background-image: url("~image~")"])
        .body_(
          dateInfo(page.created, page.changed),             
          badges(category, theme, keywords),
          H5H3(["card-title"], H5A(["href":link], mainTitle)),              
          H5Div(["card-subtitle"], H5A(["href":link], subTitle)),              
          H5P(["card-description"],                
            H5String(summary.length > 80 ? summary[0..80]~"..." : summary)))
        .footer(
          BS5ButtonLink(["stretched-link btn-ghost-info"], ["href":link]," Weiterlesen "))
    ).toString;  
	}

 */