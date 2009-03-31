class AjaxPage < Page

  def render
    
    if request.xhr?
      render_part(params['part'] || parts.first.name)
    else
      super
    end

  end

end
