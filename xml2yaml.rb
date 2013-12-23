#!/usr/bin/env ruby
require 'active_support/core_ext/hash/conversions'
require 'yaml'

input = ARGV[0] || STDIN
output = ARGV[1]

xml = String === input ? File.open(input, "r") : input
hash = Hash.from_xml(xml.read)
yaml = hash.to_yaml

unless output.blank?
  File.open(output, "w") {|f| f.write(yaml) }
else
  puts yaml
end
