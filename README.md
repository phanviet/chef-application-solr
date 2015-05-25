application-solr Cookbook
============

This cookbook helps you setup the `solr` config for rails application
- It depends on:
  + [application-defaults](https://github.com/phanviet/chef-application-defaults.git)
  + [solr](https://supermarket.chef.io/cookbooks/solr)

Attributes
----------
  + Reading `attributes` folder in cookbook to know more details

Recipes & Usage
-----
- `recipe[application-solr]`: Setup `solr` config such as: templates, files, authentication, services
- `recipe[application-solr::service]`: Setup services for `solr`
