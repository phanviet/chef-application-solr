#
# Cookbook Name:: application-solr
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

[node[:app][:solr][:installed_path],
 node[:app][:solr][:data_dir],
 node[:app][:solr][:web_config_path]].each do |dir|
  directory "#{dir}" do
    owner node[:app][:user]
    group node[:app][:group]
    mode '0755'
    recursive true
    action :create
  end
end

[node[:app][:solr][:pid_file], node[:app][:solr][:log_file]].each do |f|
  file "#{f}" do
    owner node[:app][:user]
    group node[:app][:group]
    mode '0700'
    action :create
  end
end

upload_template "#{node[:app][:config_path]}/sunspot.yml" do
  source 'sunspot.yml.erb'
end

upload_file 'solr/config/realm.properties' do
  path "#{node[:app][:config_path]}/realm.properties"
  source 'solr/config/realm.properties'
end

upload_file 'solr/config/webdefault.xml' do
  path "#{node[:app][:solr][:web_config_path]}/webdefault.xml"
  source 'solr/config/webdefault.xml'
end

upload_file 'solr/config/jetty.xml' do
  source 'solr/config/jetty.xml'
  path "#{node[:app][:solr][:web_config_path]}/jetty.xml"
end

remote_directory "#{node[:app][:solr][:data_dir]}" do
  mode '0700'
  owner node[:app][:user]
  group node[:app][:group]
  source 'solr/collection'
end

link "#{node[:app][:solr][:auth]}" do
  to "#{node[:app][:config_path]}/realm.properties"
end

include_recipe 'application-solr::service'
