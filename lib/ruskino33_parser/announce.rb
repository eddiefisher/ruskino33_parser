module Ruskino33Parser
  class Announce
    attr_accessor :url, :doc, :date

    def initialize(attributes = {})
      @date = attributes[:date].nil? ? Date.today : Date.parse(attributes[:date].to_s)
      params = { action: :anonce, date: date.strftime("%d.%m.%Y") }
      @url = "http://www.ruskino33.ru/cgi-bin/webkino2/webkino.pl?#{URI.encode_www_form(params)}"
      @doc = Nokogiri::HTML(File.open('./spec/factories/anonce.html')) if attributes[:test] == true
    end

    def movies
      doc.search('.one_film_cut').map { |movie| Ruskino33Parser::Movie.new(movie) }
    end

    private

    def doc
      @doc ||= Ruskino33Parser.parse url
    end
  end
end
