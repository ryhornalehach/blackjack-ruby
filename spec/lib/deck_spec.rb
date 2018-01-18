require "spec_helper"

RSpec.describe Deck do
  # Your tests here
  describe "#initialize" do
    it "initializes new deck of 52 cards" do
      newdeck = Deck.new
      expect(newdeck).to be_a(Deck)
      expect(newdeck.deck.length).to eq(52)
    end
  end

  describe "#shuffle" do
    it "shuffles the cards in a deck" do
      mydeck = Deck.new
      original_deck = []
      new_deck = []
      i=0
      5.times do
        original_deck << mydeck.deck[i]
      end

      mydeck.shuffle

      i=0
      5.times do
        new_deck << mydeck.deck[i]
        i += 1
      end

      expect(original_deck).not_to eq(new_deck)
    end
  end
end
