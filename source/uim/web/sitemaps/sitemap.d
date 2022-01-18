module uim.web.sitemaps.sitemap;

@safe:
import uim.web;

/* string createSitemap(string root, DateTime[string] links, DH5App[] apps...) {
  return createSitemap(root, links, apps);
}

string createSitemap(string root, DateTime[string] links, DH5App[] apps) {
  debug writeln("string createSitemap(string root, DateTime[string] links, DH5App[] apps)");  
  
  auto siteString = `<url><loc>`~root~`%s</loc><lastmod>%s</lastmod><changefreq>%s</changefreq><priority>%s</priority></url>`;
	
  string inner;
  foreach (app; apps) {
    debug writeln("APP: ", app.name);
    foreach (page; app.pages) {
      debug writeln("PAGE :", page.name);
      if (page.name == "error") continue; 
      if (page.name.has("*", ":", "?")) continue;
      inner ~= siteString.format(page.path, page.changed.toISOExtString, "monthly", "1.00");
    }
  }

  auto content = `<?xml version="1.0" encoding="UTF-8"?>`~
  `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">`~
  inner~
  `</urlset>`;
  
	return content;
}

string createSitemap(string root, DateTime[string] links, DAPPPageController[] pages) {
  debug writeln("string createSitemap(string root, DateTime[string] links, DH5App[] apps)");  
  
  auto siteString = `<url><loc>`~root~`%s</loc><lastmod>%s</lastmod><changefreq>%s</changefreq><priority>%s</priority></url>`;
	
  string inner;
  foreach (page; pages) {
    debug writeln("PAGE :", page.name);
    if (page.name == "error") continue; 
    if (page.name.has("*", ":", "?")) continue;
    inner ~= siteString.format(page.path, page.changed.toISOExtString, "monthly", "1.00");
  }

  auto content = `<?xml version="1.0" encoding="UTF-8"?>`~
  `<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">`~
  inner~
  `</urlset>`;
  
	return content;
} */
