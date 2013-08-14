#
# Cookbook Name:: typo3analytics
# Recipe:: supervisord
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

include_recipe "supervisor"

supervisor_service "consumer-download-git" do
	command "php /var/application/console analysis:consumer Download\\\\Git"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 2
 	autorestart true
	autostart true

	action :enable
end