#
# Cookbook Name:: typo3analytics
# Recipe:: databases
#
# Copyright 2013, Andy Grunwald
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "database::mysql"

# Add a new MySQL user
mysql_connection_info = {
	:host => node[:typo3analytics][:mysql_host],
	:username => node[:typo3analytics][:mysql_root][:username],
	:password => node[:typo3analytics][:mysql_root][:password]
}

# Create new MySQL user for analysis
database_user node[:typo3analytics][:mysql_user][:username] do
	connection mysql_connection_info
	password node[:typo3analytics][:mysql_user][:password]
	provider Chef::Provider::Database::MysqlUser
	action :create
end

# Grant access to new MySQL user for analysis
database_user node[:typo3analytics][:mysql_user][:username] do
	connection mysql_connection_info
	password node[:typo3analytics][:mysql_user][:password]
	provider Chef::Provider::Database::MysqlUser
	database_name node[:typo3analytics][:mysql_user][:database]
	privileges [:select,:update,:insert,:alter,:create,:delete,:drop,"CREATE VIEW"]
	action :grant
end

# Create website database
database node[:typo3analytics][:website][:mysql][:database] do
	connection mysql_connection_info
	provider Chef::Provider::Database::Mysql
	action :create
end

# Create new MySQL user for website
database_user node[:typo3analytics][:website][:mysql][:username] do
	connection mysql_connection_info
	password node[:typo3analytics][:website][:mysql][:password]
	provider Chef::Provider::Database::MysqlUser
	action :create
end

# Grant access to new MySQL user for website
database_user node[:typo3analytics][:website][:mysql][:username] do
	connection mysql_connection_info
	password node[:typo3analytics][:website][:mysql][:password]
	provider Chef::Provider::Database::MysqlUser
	database_name node[:typo3analytics][:website][:mysql][:database]
	privileges [:select,:update,:insert,:alter,:create,:delete,:drop]
	action :grant
end

databaseUserString = node[:typo3analytics][:mysql_root][:username]
if node[:typo3analytics][:mysql_root][:password].to_s != ""
	databaseUserString = databaseUserString + " -p" + node[:typo3analytics][:mysql_root][:password]
end

# Import sql scheme
execute "Create TYPO3 analysis sql scheme" do
	command "\"#{node['typo3analytics']['mysql_bin']}\" -u #{databaseUserString} < #{node[:typo3analytics][:application_dir]}/Database/database-scheme.sql"
	action :run
	only_if "\"#{node['typo3analytics']['mysql_bin']}\" -u #{databaseUserString} -e 'SHOW DATABASES;'"
end

# Setup Gerrie database
execute "Create Gerrie database" do
	cwd node[:typo3analytics][:gerrie_dir]
	command "#{node[:typo3analytics][:php_bin]} console gerrie:create-database --configFile=#{node[:typo3analytics][:gerrie_configfile]}"
	action :run
end