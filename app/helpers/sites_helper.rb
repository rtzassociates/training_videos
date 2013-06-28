module SitesHelper
  def domain_name_for(site)
    "#{request.protocol}#{site.subdomain}.#{request.domain}"
  end
  
  def site_can_view?(training_session)
    unless (current_site.can_view?(training_session) || current_user.admin?)
      redirect_to(root_url, :alert => "You are not authorized to access this page.")
    end 
  end
end
