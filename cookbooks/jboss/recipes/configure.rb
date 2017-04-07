# Preparing init script
template "/etc/init.d/jboss" do
  source "init_src.erb"
  mode "0755"
  variables({
    :home => node[:jboss][:jboss_home],
    :user => node[:jboss][:user_name]
  })
end

# Setup jboss as serice
service "jboss" do 
  supports :start => true, :stop => true
  action [:enable, :start]
end
