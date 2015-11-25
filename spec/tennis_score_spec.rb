require 'rspec'
require_relative File.join('..', 'lib', 'game')

describe Game do
  it "should start at 0-0" do
    game = Game.new
    expect(game.score).to eq([0,0])
  end
end
