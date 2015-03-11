require 'spec_helper'

describe Ruskino33Parser::Anonce do
  let(:default) { Ruskino33Parser::Anonce.new }
  let(:with_date) { Ruskino33Parser::Anonce.new(date: 1.day.ago.to_date) }

  describe "check url" do
    it "default url" do
      expect(default.url).to eq('http://www.ruskino33.ru/cgi-bin/webkino2/webkino.pl?action=anonce&date=11.03.2015')
    end

    it "url with date" do
      expect(with_date.url).to eq('http://www.ruskino33.ru/cgi-bin/webkino2/webkino.pl?action=anonce&date=10.03.2015')
    end
  end

  it "anonces" do
    ;
  end
end
