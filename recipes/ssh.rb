#
# Cookbook Name:: typo3analytics
# Recipe:: ssh
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

# Manually SSH Key deployment
# There must be a better way ... If you know one
# Please let me know
keysToDeploy = %w(%w(id_rsa 0600) %w(id_rsa.pub 0644))

keysToDeploy.each do |keyfileconfig|
	file "/home/vagrant/.ssh/#{keyfileconfig[0]}" do
		content IO.read("/vagrant/Credentials/#{keyfileconfig[0]}")
		mode "0#{keyfileconfig[1]}"
	end
end

# Start ssh-agent
execute "eval-ssh-agent" do
	command "eval `ssh-agent`"
end

# @todo ssh-add
# @todo add a entry in known hosts