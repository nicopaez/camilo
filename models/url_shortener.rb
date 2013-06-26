class UrlShortener

	attr_accessor :base_url

	def shorten sub_url
		slash = sub_url.start_with?('/')?'':'/'
		full_url = "#{@base_url}#{slash}#{sub_url}"
		Googl.shorten(full_url)
	end

	def self.for_base_url(base_url)
		shortener = UrlShortener.new
		shortener.base_url = base_url
		shortener
	end

	def self.for_default_url
		for_base_url ENV['HOST_URL']
	end

end
