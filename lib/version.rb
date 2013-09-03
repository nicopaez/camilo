class Version

	MAYOR = 1
	MINOR = 0

	def self.current
		"beta version | #{MAYOR}.#{MINOR}.#{ENV['BUILD_NUMBER']}"
	end
	
end