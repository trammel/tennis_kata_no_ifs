# frozen_string_literal: true
require 'spec'
require File.join(File.dirname(__FILE__), '..', 'lib', 'game')

RSpec.describe Game do
  it 'starts at 0-0' do
    game = described_class.new
    expect(game.score).to eq([0, 0])
  end
end
