#!/usr/bin/env ruby

require 'rubygems'
require 'rspec'

require File.dirname(__FILE__) + '/../random_password'

describe "Random password generator" do

	describe "using class methods" do

		it "should generate 3 random passwords with lengths of 8 characters" do
			passwords = RandomPassword.passwords
			passwords.size.should == 3
			while p = passwords.pop
        p.length.should == 8
        passwords.include?(p).should_not == true
			end
		end

		it "should generate 500 random passwords with lengths of 10 characters" do
			passwords = RandomPassword.passwords(500, { :length => 10 })
			passwords.size.should == 500
			while p = passwords.pop
        p.length.should == 10 
        passwords.include?(p).should_not == true
			end
		end

		it "should generate 3 random 'human' passwords with lengths of 8 characters" do
			passwords = RandomPassword.passwords(3, { :human => true })
			passwords.size.should == 3
			while p = passwords.pop
        p.length.should == 8
        passwords.include?(p).should_not == true
			end
		end

		it "should generate 500 random 'human' passwords with lengths of 8 characters, excluding characters a m z" do
			exclude_chars = [ 'a', 'm', 'z' ] 
			passwords = RandomPassword.passwords(500, { :human => true, :exclude_chars => exclude_chars })
			passwords.size.should == 500 
			while p = passwords.pop
        p.length.should == 8
        passwords.include?(p).should_not == true
				exclude_chars.each do |x|
					p.include?(x).should == false
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
			while p = passwords.pop
        p.length.should == 8
        passwords.include?(p).should_not == true
			end
		end

		it "should generate 3 random 'human' passwords with lengths of 8 characters" do
			passwords = @r.passwords(3, { :human => true })
			passwords.size.should == 3
			while p = passwords.pop
        p.length.should == 8
        passwords.include?(p).should_not == true
			end
		end

		it "should generate 4 random passwords with lengths of 10 characters" do
			passwords = @r.passwords(4, { :length => 10 })
			passwords.size.should == 4
			while p = passwords.pop
        p.length.should == 10 
        passwords.include?(p).should_not == true
			end
		end

		it "should generate 3 random passwords with lengths of 8 characters, excluding characters a M z 1 9" do
			exclude_chars = ['a', 'M', 'z', '1', '9'] 
			@r.exclude_chars(exclude_chars)
			passwords = @r.passwords
			passwords.size.should == 3
			while p = passwords.pop
        p.length.should == 8 
        passwords.include?(p).should_not == true
				exclude_chars.each do |x|
					p.include?(x).should == false
				end	
			end
		end

	end

end
