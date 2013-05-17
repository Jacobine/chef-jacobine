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

include_recipe "mysql::server"

# Copy SQL file to /tmp
template "/tmp/database-scheme.sql" do
	source "database-scheme.sql.erb"
end

# Import sql scheme
execute "import-mysql-schema" do
	command "\"#{node['typo3analytics']['mysql_bin']}\" -u root < /tmp/database-scheme.sql"
	action :run
	only_if "\"#{node['typo3analytics']['mysql_bin']}\" -u root -e 'SHOW DATABASES;'"
end

# Setup Gerrie database
execute "create-gerrie-database" do
	cwd node[:typo3analytics][:gerrie_dir]
	command "php console gerrie:create-database --configFile=#{node[:typo3analytics][:gerrie_configfile]}"
	action :run
end
