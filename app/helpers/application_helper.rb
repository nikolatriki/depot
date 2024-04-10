module ApplicationHelper
  def render_svg(path, styles: "")
    raw(File.read("app/assets/images/#{path}.svg")).gsub('<svg ', "<svg class='#{styles}' ").html_safe
  end
end
