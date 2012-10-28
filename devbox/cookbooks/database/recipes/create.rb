include_recipe "postgresql::ruby"

# create a postgresql database

connection_info = {:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']}

postgresql_database_user node['postgresql']['database_user'] do
  connection (connection_info)
  password node['postgresql']['database_user_password']
  action :create
end

postgresql_database node['postgresql']['database_name'] do
  connection (connection_info)
  owner node['postgresql']['database_user']
  action :create
end

