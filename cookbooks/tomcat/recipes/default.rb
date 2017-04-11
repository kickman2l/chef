#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java"

# Installing unzip
yum_package 'unzip' do
  action :install
end

#Install tomcat
yum_package 'tomcat' do
  action :install
end

#Start tomcat
service "tomcat" do
  supports :start => true, :stop => true
  action [:enable, :start]
end

# Downloading application
remote_file "/tmp/#{node['tomcat']['app_fname']}" do
  source node['tomcat']['app_url']
  action :create_if_missing
  mode '0755'
end

# Clear deploy directory
execute 'clear' do
  command "rm -r /usr/share/tomcat/webapps/*"
end

# Unpack application
execute 'unarchive_application' do
  command "unzip -j /tmp/testweb.zip -d /usr/share/tomcat/webapps/"
end
