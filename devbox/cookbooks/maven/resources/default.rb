#
# Cookbook Name:: maven
# Resource::      default
# Author:: Bryan W. Berry <bryan.berry@gmail.com>
# Copyright 2012, Opscode Inc.
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

actions :install

attribute :artifact_id, :kind_of => String
attribute :group_id, :kind_of => String, :required => true
attribute :dest, :kind_of => String
attribute :version, :kind_of => String, :required => true
attribute :packaging, :kind_of => String, :default => "jar"
attribute :owner, :kind_of => String, :default => "root"
attribute :mode, :kind_of => Integer, :default => 0644
attribute :repositories, :kind_of => Array
attribute :update, :kind_of => TrueClass, :default => false

alias :artifactId :artifact_id 
alias :groupId :group_id 

def initialize(*args)
  super
  # we can't use the node properties when initially specifying the resource
  @artifact_id ||= @name
  @repositories ||= node['maven']['repositories']
  @action = :install
end
