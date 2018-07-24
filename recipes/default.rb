#
# Cookbook:: cool_template
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

who_am_i = node['cool_template']['my_app']

template '/tmp/cool' do
  source 'cool.erb'
  variables key_values: node['cool_template'][who_am_i]
end
