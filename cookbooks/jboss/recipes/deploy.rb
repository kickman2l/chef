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
  not_if { ::File.directory?("#{node['jboss']['deploy_folder']}/testweb")}
end

# Set permissions to jboss
execute 'set_owner' do
  command "chown -R #{node['jboss']['user_name']}:#{node['jboss']['user_name']} #{node['jboss']['jboss_home']}"
end

