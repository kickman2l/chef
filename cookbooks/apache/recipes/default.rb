#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# Installing httpd
yum_package 'httpd' do
  action :install
end


# Preparing init script
template "/etc/httpd/conf.d/tomcat.conf" do
  source "httpd.erb"
end

# Creating maint page.
template "var/www/html/maintenance.html" do
  source "maint_page.erb"
end

#Start httpd
service "httpd" do
  supports :start => true, :stop => true
  action [:enable, :start]
end

