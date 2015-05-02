#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2015, Tomas Norre Mikkelsen
#
# All rights reserved - Do Not Redistribute
#

bash 'install_rvm' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -sSL https://get.rvm.io | bash -s stable --ruby
  source /usr/local/rvm/scripts/rvm
  EOH
  not_if 'test -f /usr/local/rvm/scripts/rvm'
end
