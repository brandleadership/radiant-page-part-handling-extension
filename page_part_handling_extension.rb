class PagePartHandlingExtension < Radiant::Extension
  version "1.0"
  description "Allow to load just a part of a page without layout."
  url "http://www.screenconcept.ch"

  def activate
    Rack::Cache::Key.send :include, PagePartHandling::RackCacheKeyExtension
  end
  
  def deactivate
  end
  
end
