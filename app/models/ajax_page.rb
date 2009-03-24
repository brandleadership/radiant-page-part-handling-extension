class AjaxPage < Page

  def render
    if @request.env['HTTP_X_REQUESTED_WITH'] != nil
      render_part(params['part'] || parts.first.name)
    else
      super
    end
  end  
end