#
# Cookbook:: cool_template
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

my_app_type = node['cool_template']['my_app']

template '/tmp/cool' do
  source 'hash_based.erb'
  variables key_values: node['cool_template'][my_app_type]
end
