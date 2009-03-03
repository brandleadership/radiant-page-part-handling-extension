module VictorHotzTags

  include Radiant::Taggable

      tag 'sessionCurrentPage' do |tag|
        tag.locals.page.request.session['lastPage'];
      end

  desc %{
    Based on content of standardtags.
    *Usage:*

    <pre><code><r:content [inherit="true|false"] [contextual="true|false"] /></code></pre>
  }
  tag 'contentByRequest' do |tag|

    part_name = defaultingPart()
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

  tag 'getNextImagePart' do |tag|
    part_name = defaultingPart()
    'part=image_' + (Integer(part_name[6..7]) + 1).to_s
  end

  tag 'getPreviousImagePart' do |tag|
    part_name = defaultingPart()
    'part=image_' + (Integer(part_name[6..7]) - 1).to_s
  end

  tag 'getImageNumberList' do |tag|
    part_name = defaultingPart()
    html = ''
    i = 1
    PagePart.find(:all, :conditions => ["page_id = ? AND name LIKE 'image_%'", tag.locals.page.id]).each do
      if Integer(part_name[6..7]) == i
        html += '<b>' + i.to_s + '</b> '
      else
        html += i.to_s + ' '
      end
      i = i + 1
    end
    html
  end

  def defaultingPart()
    part_name = request.parameters[:part];
    if part_name == nil
      part_name = 'image_1'
    end
    part_name
  end
end
