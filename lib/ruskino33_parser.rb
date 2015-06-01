require 'nokogiri'
require 'httpclient'
require 'ruskino33_parser/announce'
require 'ruskino33_parser/movie'
require "ruskino33_parser/version"
require "ruskino33_parser/premiers"

module Ruskino33Parser
  def self.fetch(url)
    HTTPClient.new.get url, nil, 'User-Agent' => 'a', 'Accept-Encoding' => 'a'
  end

  def self.parse(url)
    p = fetch url
    fail(Empty) if p.http_body.content.size.zero?
    p.status == 200 ? Nokogiri::HTML(p.body.encode('utf-8')) : fail(NotFound)
  end
end
