#!/usr/bin/env ruby

require 'rubygems'
require 'trollop'

require File.dirname(__FILE__) + '/random_password'

opts = Trollop::options do
	opt :help, 'Help', :short => 'h'
	opt :total, "The number of passwords to generate", :short => 't', :default => RandomPassword::DEF_PASSWORD_NUMBER
	opt :length, "The length of each password", :short => 'l', :default => RandomPassword::DEF_PASSWORD_LENGTH
	opt :exclude, "Exclude characters from passwords (comma separated)", :short => 'x', :default => RandomPassword::DEF_EXCLUDE_CHARS.join(',')
	opt :human, "Human like passwords (more english)"
end

r = RandomPassword.new
r.exclude_chars(opts[:exclude].split(','))

puts r.passwords(opts[:total], { :human => opts[:human], :length => opts[:length], :exclude => opts[:exclude].split(',') })
