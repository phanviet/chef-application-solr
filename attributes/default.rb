# solr config
default[:app][:solr] = {}
default[:app][:solr][:installed_path] = "#{node[:solr][:dir]}-#{node[:solr][:version]}"
default[:app][:solr][:web_app_path] = "#{node[:app][:solr][:installed_path]}/example/solr-webapp/webapp"
default[:app][:solr][:web_config_path] = "#{node[:app][:solr][:installed_path]}/example/etc"
default[:app][:solr][:data_dir] = "#{node[:app][:deploy_to]}/#{node[:app][:shared_path]}/solr"
default[:app][:solr][:pid_file] = "#{node[:app][:pids_path]}/solr.pid"
default[:app][:solr][:log_file] = "#{node[:app][:logs_path]}/solr.log"
default[:app][:solr][:auth] = "#{node[:app][:solr][:web_config_path]}/realm.properties"

default[:app][:solr][:host] = '<%= ENV["SOLR_HOST"] %>'
default[:app][:solr][:port] = '<%= ENV["SOLR_PORT"] %>'
default[:app][:solr][:path] = '<%= ENV["SOLR_PATH"] %>'
default[:app][:solr][:user] = '<%= ENV["SOLR_USER"] %>'
default[:app][:solr][:password] = '<%= ENV["SOLR_PASSWORD"] %>'
