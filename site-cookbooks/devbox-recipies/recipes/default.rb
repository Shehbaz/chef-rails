#
# Cookbook Name:: devbox-recipies
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# set unicorn config
template "/etc/init.d/unicorn" do
  source "unicorn.sh.erb"
  mode 0755
  owner 'deploy'
  group 'deploy'
end

# add init script link
execute "update-rc.d unicorn defaults" do
  not_if "ls /etc/rc2.d | grep unicorn"
end

mysql_service 'default' do
  version '5.6'
  bind_address '0.0.0.0'
  port '3306'
  initial_root_password 'dviEplBf1R'
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end