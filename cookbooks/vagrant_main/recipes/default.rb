require_recipe "apt"
require_recipe "openssl"
require_recipe "apache2"
require_recipe "mysql"
require_recipe "php"

execute "disable-default-site" do
  command "sudo a2dissite default"
  notifies :reload, resources(:service => "apache2"), :delayed
end

web_app "project" do
  template "project.conf.erb"
  notifies :reload, resources(:service => "apache2"), :delayed
end
