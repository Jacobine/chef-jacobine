#
# Cookbook Name:: typo3analytics
# Recipe:: directories
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

# Data directory
directory node[:typo3analytics][:data_dir] do
	owner node[:typo3analytics][:data_dir_user]
	group node[:typo3analytics][:data_dir_group]
	mode "0744"
	action :create
	recursive true
end

# Log directory
directory node[:typo3analytics][:log_dir] do
	owner node[:typo3analytics][:log_dir_user]
	group node[:typo3analytics][:log_dir_group]
	mode "0744"
	action :create
	recursive true
end