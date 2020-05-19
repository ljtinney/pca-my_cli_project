require "httparty"
require "nokogiri"
require "pry"
require "require_all"
require "rubocop"
require "rubocop - performance"

require_all "./lib/"


# unparsed_page = HTTParty.get(url)     @parsed_page = Nokogiri::HTML(unparsed_page) Nokogiri::HTML(HTTParty.get(url))