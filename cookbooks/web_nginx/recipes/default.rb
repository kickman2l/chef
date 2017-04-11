web "nginx" do
  provider "web_nginx"
  action [ :install_server, :start ]
end
