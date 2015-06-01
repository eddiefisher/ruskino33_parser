module Ruskino33Parser
  class Premiers
    attr_accessor :url, :doc

    def initialize
      @url = 'http://www.ruskino33.ru/cgi-bin/news0004.cgi'
    end

    def premiers
      doc.search('.one_film_cut').map { |movie| Ruskino33Parser::Movie.new(movie) }
    end

    private

    def doc
      @doc ||= Ruskino33Parser.parse url
    end
  end
end
