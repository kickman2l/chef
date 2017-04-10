#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
include_recipe "java"

# Creating user
user node['jboss']['user_name'] do
  manage_home true
  system true
  shell '/bin/bash'
  action :create
end

#  Downloading jboss archive
remote_file "#{node['jboss']['dest_folder']}#{node['jboss']['jboss_fname']}" do
  source node['jboss']['dist_url']
  action :create_if_missing
  mode '0755'
end

# Installing unzip
yum_package 'unzip' do
  action :install
end

# Unpack jboss
execute 'unarchive_jboss' do
  cwd node['jboss']['dest_folder']
  command "unzip #{node['jboss']['jboss_fname']}"
  not_if { ::File.directory?("#{node[:jboss][:jboss_home]}")}
end

# Downloading application
remote_file "#{node['jboss']['dest_folder']}#{node['jboss']['app_fname']}" do
  source node['jboss']['app_url']
  action :create_if_missing
  mode '0755'
end

# Unpack application
execute 'unarchive_application' do
  cwd node['jboss']['dest_folder']
  command "unzip #{node['jboss']['app_fname']} -d #{node['jboss']['deploy_folder']}"
  not_if { ::File.directory?("#{node['jboss']['deploy_folder']}/hudson")}
end

# Set permissions to jboss
execute 'set_owner' do
  command "chown -R #{node['jboss']['user_name']}:#{node['jboss']['user_name']} #{node['jboss']['jboss_home']}"
end

# Preparing init script
template "/etc/init.d/jboss" do
  source "init_src.erb"
  mode "0755"
  variables({
    :home => node[:jboss][:jboss_home],
    :user => node[:jboss][:user_name]
  })
end

template "#{node['jboss']['deploy_folder']}/hudson/hudson.xml" do
  source "hudson.erb"
  variables ({
  'engine' => data_bag_item('hudzon_app', 'hudson')['engine']
})
end

# Setup jboss as serice
service "jboss" do
  supports :start => true, :stop => true
  action [:enable, :start]
end
