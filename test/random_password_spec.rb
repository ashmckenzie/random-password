#!/usr/bin/env ruby

require 'rubygems'
require 'rspec'

require File.dirname(__FILE__) + '/../random_password'

describe "Random password generator" do

	describe "using class methods" do

		it "should generate 3 random passwords with lengths of 8 characters" do
			passwords = RandomPassword.passwords
			passwords.size.should == 3
			while p1 = passwords.pop
				passwords.each do |p2|
					p1.length.should == 8
					p1.should_not === p2
				end
			end
		end

		it "should generate 4 random passwords with lengths of 10 characters" do
			passwords = RandomPassword.passwords(4, 10)
			passwords.size.should == 4
			while p1 = passwords.pop
				passwords.each do |p2|
					p1.length.should == 10 
					p1.should_not === p2
				end
			end
		end

	end

	describe "using instance methods" do

		before do
			@r = RandomPassword.new
		end

		it "should generate 3 random passwords with lengths of 8 characters" do
			passwords = @r.passwords
			passwords.size.should == 3
			while p1 = passwords.pop
				passwords.each do |p2|
					p1.length.should == 8
					p1.should_not === p2
				end
			end
		end

		it "should generate 4 random passwords with lengths of 10 characters" do
			passwords = @r.passwords(4, 10)
			passwords.size.should == 4
			while p1 = passwords.pop
				passwords.each do |p2|
					p1.length.should == 10 
					p1.should_not === p2
				end
			end
		end

		it "should generate 3 random passwords with lengths of 8 characters excluding characters a M z 1 9" do
			exclude_chars = ['a', 'M', 'z', '1', '9'] 
			@r.exclude_chars(exclude_chars)
			passwords = @r.passwords
			passwords.size.should == 3
			while p1 = passwords.pop
				exclude_chars.each do |x|
					p1.include?(x).should == false
				end	
				passwords.each do |p2|
					p1.length.should == 8 
					p1.should_not === p2
				end
			end
		end

	end

end
