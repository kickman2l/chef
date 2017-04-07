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
