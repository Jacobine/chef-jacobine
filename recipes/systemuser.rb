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

analysisUser = node[:typo3analytics][:analysis][:user]

# Create system user to run analysis processes as a seperate user
user analysisUser do
	comment node[:typo3analytics][:analysis][:comment]
	gid node[:typo3analytics][:analysis][:group]
	system true
	shell node[:typo3analytics][:analysis][:shell]
end

# Add analysis user to sudoers
sudo analysisUser do
	user analysisUser
end