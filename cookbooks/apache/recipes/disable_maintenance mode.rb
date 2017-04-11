# Enable Maintenance
template "/etc/httpd/conf.d/tomcat.conf" do
  source "httpd.erb"
end

#Start tomcat
service "httpd" do
  supports :start => true, :stop => true, :restart => true
  action [:restart]
end