class RandomPassword

	DEF_PASSWORD_NUMBER = 3
	DEF_PASSWORD_LENGTH = 8
	DEF_EXCLUDE_CHARS = [ '`', 'l' ]

	def initialize
		@exclude_chars = DEF_EXCLUDE_CHARS
	end

	def exclude_chars(chars=[])
		@exclude_chars += chars.to_a
	end

	def passwords(total=3, length=8)
		@passwords = []
		total.times do
			@passwords << length.times.collect {
				while x = (rand(56) + 65).chr
					break if @exclude_chars.empty? or not @exclude_chars.include?(x)
				end
				x
			}.join
		end
		@passwords
	end

	def self.passwords(*params)
		r = self.new
		r.passwords(*params)
	end

end
