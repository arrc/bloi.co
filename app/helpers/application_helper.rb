module ApplicationHelper
  def page_title(page_title_name)
    content_for(:title) { page_title_name }
  end

  # https://gist.github.com/mynameispj/5692162 <- Say Thank you! :)
  def current_class?(test_path)
    return 'bl_active' if request.path == test_path
    ''
  end

# http://stackoverflow.com/a/3708730
  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end
end
