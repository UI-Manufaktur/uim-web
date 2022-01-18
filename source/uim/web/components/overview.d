module uim.web.components.overview;

@safe:
import uim.web;
/* 
string webOverview(DAPPPageController overview, DAPPPageController[] pages) {
	string inners;
	auto content = overview.parameters.get("pageContent", "");
  if (content.length > 0) inners ~= content ~"<hr>";	
	
  foreach(page; pages) {
		if (page.name == "index") continue;
		if (page.name == "error") continue;
		
		inners ~= webEntry(page);
	}

	auto image = overview.parameters.get("pageImage", "");	
	auto mainTitle = overview.parameters.get("pageMainTitle", "");	
	auto subTitle = overview.parameters.get("pageSubTitle", "");
	auto summary = overview.parameters.get("pageSummary", "");
	auto category = overview.parameters.get("pageCategory", "");
	
	return 
		pageImageHeader(image, mainTitle, subTitle)~
		H5Div(["main", "main-raised"], 
			breadcrumbs(["/"], ["UI Manufaktur"], category)~ 
			BS5Container(H5Div(["section"], BS5Row(inners))).toString
		).toString; 
} */