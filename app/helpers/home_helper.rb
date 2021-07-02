module HomeHelper
	def articles(query)
		require 'rss'
		require 'open-uri'
		url = "https://news.google.com/rss/search?cf=all&h1=en-US&pz=1&q=#{query}&gl=US&ceid=US:en"
		URI.open(url) do |rss|
			RSS::Parser.parse(rss)
		end
	end
end
