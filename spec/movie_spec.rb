require 'spec_helper'

describe Ruskino33Parser::Movie do
  let(:anonce) { Ruskino33Parser::Anonce.new test: true }
  let(:movie) { anonce.movies.first }

  let(:title) { 'Духless 2' }
  let(:schedules) {
    [
      { hall: "Большой зал", time: "20:40", prices: { vip: 200, doble_seat: 150, economy: 150 }, book_url: "http://www.ruskino33.ru/movies/session.shtml?id=1742&sid=53690&date=12.03.2015#session_info" },
      { hall: "Большой зал", time: "23:00", prices: { vip: 300, doble_seat: 250, economy: 250 }, book_url: "http://www.ruskino33.ru/movies/session.shtml?id=1742&sid=53691&date=12.03.2015#session_info" },
      { hall: "Малый зал", time: "16:45", prices: { vip: 250, doble_seat: 200, economy: 200 }, book_url: "http://www.ruskino33.ru/movies/session.shtml?id=1742&sid=53563&date=12.03.2015#session_info" }
    ]
  }
  let(:other_days) {
    url = 'http://www.ruskino33.ru/movies/film.shtml'
    [
      { date: "13.03.2015", url: "#{url}?id=1742&date=13.03.2015" }, { date: "14.03.2015", url: "#{url}?id=1742&date=14.03.2015" },
      { date: "15.03.2015", url: "#{url}?id=1742&date=15.03.2015" }, { date: "16.03.2015", url: "#{url}?id=1742&date=16.03.2015" },
      { date: "17.03.2015", url: "#{url}?id=1742&date=17.03.2015" }, { date: "18.03.2015", url: "#{url}?id=1742&date=18.03.2015" }
    ]
  }

  it { expect(anonce.movies.count).to eq(2) }
  it { expect(movie.title).to eq(title) }
  it { expect(movie.schedules).to eq(schedules) }
  it { expect(movie.other_days).to eq(other_days) }
end
