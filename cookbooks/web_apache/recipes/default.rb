web "apache" do
  provider "web_apache"
  action [ :install_server, :start ]
end

