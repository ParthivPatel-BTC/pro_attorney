module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="align-center alert alert-<%= name %>"> <button type="button"
    class="close" data-dismiss="alert">×</button>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end