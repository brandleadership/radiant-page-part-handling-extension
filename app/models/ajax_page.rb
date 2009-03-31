class AjaxPage < Page

  def render
    if @request.env['X_REQUESTED_WITH'].casecmp("XmlHttpRequest") > -1 || 
       @request.env['HTTP_X_REQUESTED_WITH'].casecmp("XmlHttpRequest") > -1
      
	render_part(params['part'] || parts.first.name)
    else
      super
    end
  end  
end
