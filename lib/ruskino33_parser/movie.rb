module Ruskino33Parser
  class Movie
    attr_accessor :name, :url, :date, :sid

    # get Nokogiri
    def initialize(movie)
      @movie = movie
    end

    def name
      @name = @movie.search('.film_desc h3').first.text
    end

    def schedules
      schedules = []
      @movie.search('table.sheet tr').each_with_index do |tr, idx|
        next if idx == 0
        schedules.push prepare_schedule(tr.search('td'))
      end
      schedules
    end

    private

    def prepare_schedule(cell)
      {
        hall: cell.first.text,
        prices: [
          { time: prepare_time(cell.last), price: prepare_price },
          { time: prepare_time(cell.last), price: prepare_price }
        ]
      }
    end

    def prepare_price
      { vip: 100, doble_seat: '100', economy: '100' }
    end

    def prepare_time(cell)
      "#{cell.search('a').first.text}:#{cell.search('sup').first.text}"
    end
  end
end
