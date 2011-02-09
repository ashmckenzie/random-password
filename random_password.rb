class RandomPassword

	DEF_PASSWORD_NUMBER = 3
	DEF_PASSWORD_LENGTH = 8
	DEF_EXCLUDE_CHARS = %w{ ` l [ ] \\ / ^ ? < > = - _ : ; }

  DEF_DICT_FILE = 'dict.txt'

	def initialize
		@exclude_chars = DEF_EXCLUDE_CHARS
	end

	def exclude_chars(chars=[])
		@exclude_chars += chars.to_a
	end

  def passwords(total=nil, params={})

		total = DEF_PASSWORD_NUMBER unless total.is_a?(Fixnum)
		params[:length] = DEF_PASSWORD_LENGTH unless params[:length].is_a?(Fixnum)
		params[:exclude_chars] = [] unless params[:exclude_chars].is_a?(Array)

		exclude_chars(params[:exclude_chars])

		method = 'random_passwords'

		if params[:human]
			params.delete(:human)	
			method = 'human_passwords'
		end

		self.send(method, total, params)

	end

	def self.passwords(total=nil, params={})
		r = self.new
		r.passwords(total, params)
	end

	private

	def random_passwords(total, params)
		passwords = []
		total.times do
			passwords << params[:length].times.collect {
				while x = (rand(74) + 48).chr
					break if @exclude_chars.empty? or not @exclude_chars.include?(x)
				end
				x
			}.to_s
		end
		passwords
	end

	def human_passwords(total, params)
    passwords = []
    words = open(DEF_DICT_FILE).collect { |x| x.chomp }
    total.times do
      word = ''
      begin
        w = words[rand(words.size)]
				w.gsub!(%r{[#{Regexp.escape(@exclude_chars.to_s)}]}, '')
        word += w[0, w.length / 2]
      end while word.length < params[:length]
      passwords << word[0, params[:length]]
    end
    passwords
  end

end
