action :install_server do
  package "httpd" do
    action :install
  end
end

action :start do
  service "httpd" do
    action :start
  end
end

action :stop do
  service "httpd" do
    action :stop
  end
end

action :restart do
  service "httpd" do
    action :restart
  end
end

action :reload do
  service "httpd" do
    action :reload
  end
end
