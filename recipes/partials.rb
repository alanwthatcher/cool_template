#
# Cookbook:: cool_template
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
template '/tmp/template_partials.txt' do
  source 'partials.erb'
end

template '/tmp/template_partials_with_hash_based_example.txt' do
  source 'partials_with_hash_based_example.erb'
end
