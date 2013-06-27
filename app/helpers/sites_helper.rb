module SitesHelper
  def domain_name_for(site)
    "#{request.protocol}#{site.subdomain}.#{request.domain}"
  end
end
