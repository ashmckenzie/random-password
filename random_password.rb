class RandomPassword

	DEF_PASSWORD_NUMBER = 3
	DEF_PASSWORD_LENGTH = 8
	DEF_EXCLUDE_CHARS = [ '`', 'l', '[', ']', '\\', '/', '^', '?', '<', '>', '=', '-', '_', ':', ';' ]

  DEF_DICT_FILE = 'dict.txt'

	def initialize
		@exclude_chars = DEF_EXCLUDE_CHARS
	end

	def exclude_chars(chars=[])
		@exclude_chars += chars.to_a
	end

	def passwords(total=DEF_PASSWORD_NUMBER, length=DEF_PASSWORD_LENGTH)
		@passwords = []
		total.times do
			@passwords << length.times.collect {
				while x = (rand(74) + 48).chr
					break if @exclude_chars.empty? or not @exclude_chars.include?(x)
				end
				x
			}.join
		end
		@passwords
	end

  def human_passwords(total=DEF_PASSWORD_NUMBER, length=DEF_PASSWORD_LENGTH)
    @passwords = []
    words = open(DEF_DICT_FILE).collect { |x| x.chomp }

    total.times do
      word = ''
      begin
        w = words[rand(words.size)]
        word += w[0, w.length / 2]
      end while word.length < length
      @passwords << word[0, length]
    end
    @passwords
  end

	def self.passwords(*params)
		r = self.new
		r.passwords(*params)
	end

  def self.human_passwords(*params)
    r = self.new
    r.human_passwords(*params)
  end

end
