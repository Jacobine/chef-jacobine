#
# Cookbook Name:: typo3analytics
# Recipe:: website
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

websiteDir = node[:typo3analytics][:website][:dir]
websiteUser = node[:typo3analytics][:website][:dir_user]
websiteGroup = node[:typo3analytics][:website][:dir_group]

# Website directory
directory websiteDir do
	owner websiteUser
	group websiteGroup
	mode "0775"
	action :create
	recursive true
end

# Cloning the application
git node[:typo3analytics][:website][:dir] do
	repository node[:typo3analytics][:website][:repository]
	reference node[:typo3analytics][:website][:revision]
	action :sync
	user websiteUser
	group websiteGroup
end

# Create Apache2 VHost
web_app node[:typo3analytics][:website][:sitename] do
	ip node[:typo3analytics][:website][:ip]
	server_name node[:typo3analytics][:website][:url]
	server_aliases []
	docroot "#{websiteDir}/www"
	enable true
end

# @todo add comment to deploy database manual