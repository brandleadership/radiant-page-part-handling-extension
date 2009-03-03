module PagePartHandlingTags

  include Radiant::Taggable

  desc %{
    Renders the requested part in layout. Request "?part=[part]"
    *Usage:*

    <pre><code><r:contentByRequest [inherit="true|false"] [contextual="true|false"] /></code></pre>
  }
  tag 'contentByRequest' do |tag|
    part_name = request.parameters[:part];

    #Code from standard tag content
    page = tag.locals.page
    boolean_attr = proc do |attribute_name, default|
      attribute = (tag.attr[attribute_name] || default).to_s
      raise TagError.new(%{`#{attribute_name}' attribute of `content' tag must be set to either "true" or "false"}) unless attribute =~ /true|false/i
      (attribute.downcase == 'true') ? true : false
    end
    inherit = boolean_attr['inherit', false]
    part_page = page
    if inherit
      while (part_page.part(part_name).nil? and (not part_page.parent.nil?)) do
        part_page = part_page.parent
      end
    end
    contextual = boolean_attr['contextual', true]
    part = part_page.part(part_name)
    tag.locals.page = part_page unless contextual
    tag.globals.page.render_snippet(part) unless part.nil?
  end

end
