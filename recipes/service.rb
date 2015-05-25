service "solr" do
  action [:enable, :start]
  supports [:start, :restart, :stop]
end