#
# Cookbook Name:: typo3analytics
# Recipe:: systemuser
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

supervisordUser = node[:typo3analytics][:supervisord_user]

# Create system user to run processes as a seperate user
user supervisordUser do
	comment "System user to execute supervisord processes"
	gid "www-data"
	system true
	shell "/bin/false"
end
