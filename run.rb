#!/usr/bin/env ruby

require 'rubygems'
require 'trollop'

require File.dirname(__FILE__) + '/random_password'

opts = Trollop::options do

	opt :help, 'Help', :short => 'h'
	opt :count, "The number of passwords to generate", :short => 'c', :default => RandomPassword::DEF_PASSWORD_NUMBER
	opt :length, "The length of each password", :short => 'l', :default => RandomPassword::DEF_PASSWORD_LENGTH
	opt :exclude, "Exclude characters from passwords", :short => 'x', :default => RandomPassword::DEF_EXCLUDE_CHARS.join(',')
end

r = RandomPassword.new
r.exclude_chars(opts[:exclude].split(','))
puts r.passwords(opts[:count], opts[:length]).join("\n")
puts '--'
puts r.human_passwords(opts[:count], opts[:length]).join("\n")
