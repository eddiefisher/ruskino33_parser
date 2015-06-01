module Ruskino33Parser
  class Movie
    def initialize(movie)
      @movie = movie
    end

    def title
      @movie.search('.film_desc h3').first.text
    end

    def schedules
      result = []
      @movie.search('table.sheet tr').each do |tr|
        next if tr.search('td').first.text == 'Зал'
        result += prepare_schedule(tr.search('td'))
      end
      result
    end

    def other_days
      @movie.search('.other_days a').map do |other_day|
        {
          date: other_day.text,
          url: "http://www.ruskino33.ru#{other_day.attribute('href')}"
        }
      end
    end

    private

    def prepare_schedule(cell)
      cell.last.search('a').map do |time|
        {
          hall: cell.first.text,
          time: "#{time.text}:#{time.next.text}",
          prices: prepare_price(time.attribute('title').text),
          book_url: "http://www.ruskino33.ru#{time.attribute('href')}#session_info"
        }
      end
    end

    def prepare_price(prices)
      prices = prices.split(';').map { |price| price.sub!('руб', '').to_i }
      { vip: prices[0], doble_seat: prices[1], economy: prices[2] }
    end
  end
end
