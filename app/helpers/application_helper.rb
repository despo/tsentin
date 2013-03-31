# encoding: UTF-8
module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
    #{messages}
    </div>
    HTML
    html.html_safe
  end

  def path_for_all_tags
    @current_city ? city_offers_path(@current_city.name) : root_path
  end

  def all_tags_class
    @selected_tag ? '' : 'active'
  end

  def current_city
    @current_city ? @current_city.name : "Σε όλες τις πόλεις"
  end

  def path_for_tag tag
    @current_city ? tagged_city_offers_path(@current_city.name, tag.name) :  tagged_offers_path(tag.name)
  end

  def class_for_tag tag
    @selected_tag.eql?(tag.name) ? 'active' : ''
  end
end
