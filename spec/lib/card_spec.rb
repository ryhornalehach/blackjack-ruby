require "spec_helper"

RSpec.describe Card do
  # Your tests here
  describe "#initialize" do
    it "takes a name of the card and create a new Card object with corresponding value and suit" do
      newcard1 = Card.new(5, '♠')
      expect(newcard1).to be_a(Card)
      expect(newcard1.rank).to eq(5)
      expect(newcard1.suit).to eq('♠')
      expect(newcard1.value).to eq(5)

      newcard2 = Card.new('Q', '♣')
      expect(newcard2).to be_a(Card)
      expect(newcard2.rank).to eq('Q')
      expect(newcard2.suit).to eq('♣')
      expect(newcard2.value).to eq(10)
    end
  end
end
