module PagePartHandling
  module SiteControllerExtension
    def self.included(base)
      base.class_eval { before_filter :set_rendered_part }
    end

    def set_rendered_part
      @cache.instance_variable_set(:@is_ajax_page, @_request.env['HTTP_X_REQUESTED_WITH'] != nil)
      @cache.instance_variable_set(:@parameters, @_params)
    end
  end
end