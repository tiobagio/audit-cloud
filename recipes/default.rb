#
# Cookbook:: audit-cloud
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

ENV['AWS_ACCESS_KEY_ID'] = "ASIAXHDZVFZT7BWNNUMM"
ENV['AWS_SECRET_ACCESS_KEY_ID'] = "Xp/VFNnQtlHA0awEbKGQscY95sEk4c22jvc7Xbn1"
ENV['AWS_REGION'] = "us-west-2"

node.override['audit']['fetcher'] = 'chef-server'
node.override['audit']['reporter'] = 'chef-server-automate'


case node['os']
when 'linux'
  node.override['audit']['profiles']['aws-cloud']['compliance'] = "delivery/cis-aws-benchmark-level1"
  node.override['audit']['profiles']['aws-cloud2']['compliance']['url'] = "https://github.com/inspec/inspec-aws/archive/v1.29.9.tar.gz"
when 'windows'
  node.override['audit']['profiles']['aws-cloud']['compliance'] = "delivery/cis-aws-benchmark-level1"
  node.override['audit']['profiles']['aws-cloud2']['compliance']['url'] = "https://github.com/inspec/inspec-aws/archive/v1.29.9.tar.gz"
end

include_recipe 'audit'