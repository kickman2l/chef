if "#{node['web_server_type']}" == "web_nginx"
  include_recipe 'web_nginx'
elsif "#{node['web_server_type']}" == "web_apache"
  include_recipe 'web_apache'
end
