module ApplicationHelper

  def cur_path(path)
    'nav-color' if current_page?(path)
  end


end
