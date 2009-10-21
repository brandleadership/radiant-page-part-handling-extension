module PagePartHandling
  module RackCacheKeyExtension

    def self.included(base)
      base.instance_eval do
        alias_method_chain :generate, :ajax
      end
    end

    def generate_with_ajax
      #original rack cache code
      parts = []
      parts << @request.scheme << "://"
      parts << @request.host

        if @request.scheme == "https" && @request.port != 443 ||
            @request.scheme == "http" && @request.port != 80
          parts << ":" << @request.port.to_s
        end

        parts << @request.script_name
        parts << @request.path_info

        if qs = query_string
          parts << "?"
          parts << qs
        end

        #code for ajax page
        if ( @request.xhr? )
          parts << ':ajax-page'
        else
          parts << ':no-ajax-page'
        end

        parts.join
      end
  
  end
end