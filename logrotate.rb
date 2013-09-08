#
# Cookbook Name:: typo3analytics
# Recipe:: logrotate
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

include_recipe "logrotate"

logDir = node[:typo3analytics][:log_dir]

# Stream-logfiles
logrotate_app "analysis-crawler-gerritproject" do
	cookbook "logrotate"
	path "#{logDir}/crawler.gerritproject-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-crawler-gerrit" do
	cookbook "logrotate"
	path "#{logDir}/crawler.gerrit-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-crawler-gitweb" do
	cookbook "logrotate"
	path "#{logDir}/crawler.gitweb-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-analysis-cvsanaly" do
	cookbook "logrotate"
	path "#{logDir}/analysis.cvsanaly-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-analysis-filesize" do
	cookbook "logrotate"
	path "#{logDir}/analysis.filesize-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-analysis-githublinguist" do
	cookbook "logrotate"
	path "#{logDir}/analysis.githublinguist-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-analysis-phploc" do
	cookbook "logrotate"
	path "#{logDir}/analysis.phploc-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-download-git" do
	cookbook "logrotate"
	path "#{logDir}/download.git-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-download-http" do
	cookbook "logrotate"
	path "#{logDir}/download.http-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

logrotate_app "analysis-extract-targz" do
	cookbook "logrotate"
	path "#{logDir}/extract.targz-stream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "compress"]
	rotate 31
end

# Error-logfiles
logrotate_app "analysis-download-git-error" do
	cookbook "logrotate"
	path "#{logDir}/download.git-errorstream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "missingok", "compress"]
	rotate 31
end

logrotate_app "analysis-download-http-error" do
	cookbook "logrotate"
	path "#{logDir}/download.http-errorstream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "missingok", "compress"]
	rotate 31
end

logrotate_app "analysis-analysis-cvsanaly-error" do
	cookbook "logrotate"
	path "#{logDir}/analysis.cvsanaly-errorstream.log"
	enable true
	frequency "daily"
	options ["copytruncate", "dateext", "missingok", "compress"]
	rotate 31
end