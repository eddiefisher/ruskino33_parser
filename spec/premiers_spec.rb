require 'spec_helper'

describe Ruskino33Parser::Premiers do
  let(:premier) { Ruskino33Parser::Premiers.new }

  it { expect(premier.premiers.count).to eq(5) }
end
