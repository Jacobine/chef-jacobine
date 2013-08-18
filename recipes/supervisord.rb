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

consoleBin = node[:typo3analytics][:console_bin]

# Consumer: Download\\Git
supervisor_service "consumer-download-git" do
	command "php #{consoleBin} analysis:consumer Download\\\\Git"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 2
	autorestart true
	autostart true

	action :enable
end

# Consumer: Download\\HTTP
supervisor_service "consumer-download-http" do
	command "php #{consoleBin} analysis:consumer Download\\\\HTTP"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 2
	autorestart true
	autostart true

	action :enable
end

# Consumer: Extract\\Targz
supervisor_service "consumer-extract-targz" do
	command "php #{consoleBin} analysis:consumer Extract\\\\Targz"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 1
	autorestart true
	autostart true

	action :enable
end

# Consumer: Crawler\\Gitweb
supervisor_service "consumer-crawler-gitweb" do
	command "php #{consoleBin} analysis:consumer Crawler\\\\Gitweb"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 1
	autorestart true
	autostart true

	action :enable
end

# Consumer: Analysis\\Filesize
supervisor_service "consumer-analysis-filesize" do
	command "php #{consoleBin} analysis:consumer Analysis\\\\Filesize"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 1
	autorestart true
	autostart true

	action :enable
end

# Consumer: Analysis\\GithubLinguist
supervisor_service "consumer-analysis-githublinguist" do
	command "php #{consoleBin} analysis:consumer Analysis\\\\GithubLinguist"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 1
	autorestart true
	autostart true

	action :enable
end

# Consumer: Analysis\\PHPLoc
supervisor_service "consumer-analysis-phploc" do
	command "php #{consoleBin} analysis:consumer Analysis\\\\PHPLoc"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 2
	autorestart true
	autostart true

	action :enable
end

# Consumer: Analysis\\CVSAnaly
supervisor_service "consumer-analysis-cvsanaly" do
	command "php #{consoleBin} analysis:consumer Analysis\\\\CVSAnaly"
	process_name "%(program_name)s_%(process_num)02d"
	numprocs 3
	autorestart true
	autostart true

	action :enable
end

# @todo add Crawler\\Gerrit && Crawler\\GerritProject
# Why are they not added yet?
# Because this Gerrit consumer works over SSH and to enable
# SSH connection to Gerrit you have to add your SSH key