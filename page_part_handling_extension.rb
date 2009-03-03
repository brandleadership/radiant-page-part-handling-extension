class PagePartHandlingExtension < Radiant::Extension
  version "1.0"
  description "Allow to load just a part of a page without layout."
  url "http://www.screenconcept.ch"

  def activate
    SiteController.send :include, PagePartHandling::SiteControllerExtension
    ResponseCache.instance_eval { include PagePartHandling::ResponseCacheExtension }
    Page.send :include, PagePartHandlingTags
  end
  
  def deactivate
  end
  
end
