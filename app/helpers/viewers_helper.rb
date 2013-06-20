module ViewersHelper
  def current_viewer
    @current_viewer ||= Viewer.find_by_id( cookies[:viewer_id] ) if cookies[:viewer_id]
  end
end
