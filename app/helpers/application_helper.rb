module ApplicationHelper

def my_name
"Jose Alvarez"
end

def form_group_tag(errors, &block)
  if errors.any?
    content_tag :div, capture(&block), class: 'form-group-has-error'
  else
    content_tag :div, capture(&block), class: 'form-group'
  end
end

def markdown(text)
  renderer = Redcarpet::Render::HTML.new
  extensions = {fenced_code_blocks: true}
  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  (redcarpet.render text).html_safe
end

def will_paginate(resource)
  tot = resource.except(:limit, :offset).count
  lim = resource.limit_value
  
  page_num = (tot/lim.to_f).ceil
  @html = String.new

  (1..page_num).each do |i|
    @html += link_to "#{i} // ", params.merge( page: "#{i}")
  end

  @html.html_safe
end


end
