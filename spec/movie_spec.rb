require 'spec_helper'

describe Ruskino33Parser::Movie do
  let(:today) { Ruskino33Parser::Anonce.new date: '2015-03-11' }
  let(:movie) { today.movies.first }

  it { expect(movie.name).to eq('Духless 2') }
  it { expect(movie.schedules).to eq([{ hall: "Большой зал", time: "21:25" }]) }
end
