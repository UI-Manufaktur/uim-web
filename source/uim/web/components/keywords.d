module uim.web.components.keywords;

@safe: 
import uim.web; 

/* void addKeywordPages(DAPPApplication app, DAPPPageController[][string] keywordPages) {
  addMainKeywordPage(app, keywordPages);

  keywordPages.byKeyValue.each!(kv => addKeywordPage(app, kv.key, kv.value));
}

void addMainKeywordPage(DAPPApplication app, DAPPPageController[][string] keywordPages) {
  app.pages("keywords", new class DAPPPageController {
		this() { 
      super(); 
      this
      .created(DateTime(2017, 5, 2, 10, 10, 0))
      .changed(timeLastModified(__FILE_FULL_PATH__))
      .parameters([
          "pageTitle": "Keywords - Manufaktur",
          "pageMainTitle": "Wer sucht, der findet",
          "pageSubTitle": "Unsere Keywords",
          "pageCategory": "page",
          "pageKeywords": "",
          "pageTheme": "Keywords",
          "pageImage": "/img/keywords.jpg",
          "pageSummary": "",
          "pageContent": ``]);
        } 
				
      override string content(STRINGAA someParameters = null) {  
				string inners;

        foreach(kw; keywordPages.getKeys.sort) {
          inners ~= BS5ButtonLink(["btn-primary btn-sm me-1"], ["href":"/keywords/"~kw.toLower], kw).toString;
        }

    auto theme = this.parameters.get("pageTheme", "");
    auto category = this.parameters.get("pageCategory", "");			
    auto keywords = this.parameters.get("pageKeywords", "").split("#");
    auto image = this.parameters.get("pageImage", "");	
    auto mainTitle = this.parameters.get("pageMainTitle", "");	
    auto subTitle = this.parameters.get("pageSubTitle", "");
    auto summary = this.parameters.get("pageSummary", "");
    auto link = this.parameters.get("pageLink", categoryToLink(category)~"/"~theme.toLower~"/"~this.name.toLower);	 

			return 
  pageImageHeader(image, mainTitle, subTitle)~
  BS5Row(["mt-2 row-cards"], 
    H5Div(["main", "main-raised"], 
        BS5Container(
        //dateInfo(created, changed),
        //badges(theme),
        H5Div(["section"], 
          BS5Row(["row-cards"], 
            BS5Col(["col-sm-12 col-md-10 col-lg-8"], inners)))))).toString;

	}});
}

void addKeywordPage(DAPPApplication app, string keyword, DAPPPageController[] keywordPages) {
  app.pages("keywords/"~keyword.toLower, new class DAPPPageController {
		this() { 
      super(); 
      this
      .created(DateTime(2017, 5, 2, 10, 10, 0))
      .changed(timeLastModified(__FILE_FULL_PATH__))
      .parameters([
          "pageTitle": "Keywords - Manufaktur",
          "pageMainTitle": "Wer sucht, der findet",
          "pageSubTitle": "Gefundene Seiten zum Stichwort "~keyword,
          "pageCategory": "page",
          "pageKeywords": "#"~keyword,
          "pageTheme": "Keywords",
          "pageImage": "/img/keywords.jpg",
          "pageSummary": "",
          "pageContent": ``]);
        } 
				
      override string content(STRINGAA someParameters = null) {  
				string inners;

				foreach(page; keywordPages) {
          if (page.name == "index") continue;
          if (page.name == "error") continue;
          
          auto theme = page.parameters.get("pageTheme", "");
          auto category = page.parameters.get("pageCategory", "");			
          auto image = page.parameters.get("pageImage", "");	
          auto mainTitle = page.parameters.get("pageMainTitle", "");	
          auto subTitle = page.parameters.get("pageSubTitle", "");	
          auto summary = page.parameters.get("pageSummary", "");
          auto link = categoryToLink(category)~"/"~theme.toLower~"/"~page.name.toLower;	
          string[] kws = page.parameters.get("pageKeywords", "").split("#");

				  inners ~= 
				H5Div(["col-sm-6", "col-md-4", "col-lg-3"],          
          BS5Card(["card-plain", "card-blog"],            
            H5Div(["card-header", "card-header-image"],              
              H5A(["href":link],                
                H5Img(["img", "img-raised"],["src":image]))),            
            H5Div(["card-body"],    
              dateInfo(page.created, page.changed),          
              badges(category, theme, kws),              
              H5H2(["card-title"], H5A(["href":link], mainTitle)),              
              H5H4(["card-title"], H5A(["href":link], subTitle)),              
								H5P(["card-description"],                
									H5String(summary),                
									H5A(["href":link]," Weiterlesen "))))).toString;  
			}

			return 
        pageImageHeader("/img/bg10.jpg", "Blogs aus der UI Manufaktur Schmiede")~
        BS5Row(["mt-2 row-cards"], 
  			  H5Div(["main", "main-raised"], 
					  BS5Container(H5Div(["section"], BS5Row(inners))))).toString;     
	}});
}
 */