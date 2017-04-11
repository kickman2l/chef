# Enable Maintenance

template "/etc/httpd/conf.d/tomcat.conf" do
  source "maint_cfg.erb"
  variables({
    :maintenance_file => node[:apache][:directory]
  })
end

#Start tomcat
service "httpd" do
  supports :start => true, :stop => true, :restart => true
  action [:restart]
end