#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2014, Tomas Norre Mikkelsen
#
# All rights reserved - Do Not Redistribute
#

bash "install_rvm" do
  user "root"
  cwd "/tmp"
  code <<-EOH
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  source /usr/local/rvm/scripts/rvm
  EOH
end

# Add jenkins user to rvm group
group "rvm" do
  action :modify
  members "jenkins"
  append true
end
