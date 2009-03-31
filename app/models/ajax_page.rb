class AjaxPage < Page

  def render
    
    requested_with = @request.env['X_REQUESTED_WITH'] || @request.env['HTTP_X_REQUESTED_WITH'] || ""

    if requested_with.casecmp("XMLHttpRequest") > -1
      render_part(params['part'] || parts.first.name)
    else
      super
    end

  end
  
end
