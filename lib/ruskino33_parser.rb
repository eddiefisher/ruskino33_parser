require 'nokogiri'
require 'httpclient'
require 'ruskino33_parser/anonce'
require 'ruskino33_parser/movie'
require "ruskino33_parser/version"

module Ruskino33Parser

  # Headers are needed to mimic proper request to ruskino33
  def self.fetch(url)
    HTTPClient.new.get url, nil, { 'User-Agent'=>'a', 'Accept-Encoding'=>'a' }
  end

  # Returns a nokogiri document or an error if fetch response status is not 200
  def self.parse(url)
    p = fetch url
    raise(Empty) if p.http_body.content.size.zero?
    p.status == 200 ? Nokogiri::HTML(p.body.encode('utf-8')) : raise(NotFound)
  end
end
