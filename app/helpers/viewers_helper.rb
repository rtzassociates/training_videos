module ViewersHelper
  def current_viewer
    @current_viewer ||= Viewer.find_by_id( cookies[:viewer_id] ) if cookies[:viewer_id]
  end
  
  def store_viewer(viewer)
    cookies[:viewer_id] = viewer.id
    redirect_to site_training_sessions_path
  end
end