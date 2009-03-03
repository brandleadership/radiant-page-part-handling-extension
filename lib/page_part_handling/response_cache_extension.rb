module PagePartHandling
  module ResponseCacheExtension

    def self.included(base)
      base.instance_eval do
        alias_method_chain :page_cache_path, :ajax
      end
    end

    def page_cache_path_with_ajax(path)
      #original radiant code
      path = (path.empty? || path == "/") ? "/_site-root" : URI.unescape(path)
      root_dir = File.expand_path(page_cache_directory)
      cache_path = File.expand_path(File.join(root_dir, path), root_dir)
      cache_path if cache_path.index(root_dir) == 0

      if @parameters != nil
        @parameters.sort.each { |key, value|
          if key != 'action' && key != 'url' && key != 'controller'
            cache_path += '_' + key + '_' + value
          end
        }
      end
      if @is_ajax_page
         cache_path += "_ajax"
       end
      cache_path
    end
    
  end
end