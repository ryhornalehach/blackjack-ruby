require "spec_helper"

RSpec.describe Hand do
  # Your tests here
  let(:new_player) {Hand.new}
  let(:card1) {Card.new(4, '♦')}
  let(:card2) {Card.new('J', '♥')}
  let(:card3) {Card.new('A', '♠')}
  describe "#initialize" do
    it "initializes a new 'Hand' object with no cards" do
      expect(new_player).to be_a(Hand)
      expect(new_player.cards).to eq([])
      expect(new_player.total).to eq(0)
    end
  end

  describe "#get_card" do
    it "gets a card as an input and put it in the 'cards' array" do
      new_player.get_card(card1)
      new_player.get_card(card2)
      new_player.get_card(card3)
      expect(new_player.cards[0].rank).to eq(4)
      expect(new_player.cards[1].rank).to eq('J')
      expect(new_player.cards[2].rank).to eq('A')
    end
    it "increment 'total' variable with the value of each new card added to the hand" do
      new_player.get_card(card1)
      expect(new_player.total).to eq(4)
      new_player.get_card(card2)
      expect(new_player.total).to eq(14)
      new_player.get_card(card3)
      expect(new_player.total).to eq(25)
    end
  end

  describe "#display_hand" do
    it "print out the cards at the array" do
      new_player.get_card(card1)
      expect(new_player.display_hand('Player')).to start_with("4♦, ")
      new_player.get_card(card3)
      expect(new_player.display_hand('Player')).to start_with("4♦, A♠")
    end
    it "print out the total score of the player" do
      new_player.get_card(card1)
      expect(new_player.display_hand('Player')).to end_with(", 4")
      new_player.get_card(card3)
      expect(new_player.display_hand('Player')).to end_with(", 15")
    end
  end

  describe "#players_turn" do
    it "gets user input" do
      new_deck = Deck.new
      new_deck.shuffle
      new_player.get_card(card1)
      new_player.players_turn("Player", new_deck)
    end
  end

  describe "#check_for_aces" do
    it "returns true if the player have an ace and more than 21 points score" do
      new_player.get_card(card1)
      new_player.get_card(card2)
      new_player.get_card(card3)
      expect(new_player.check_for_aces).to be true
    end
    it "returns false if player does not have an ace" do
      new_player.get_card(card2)
      expect(new_player.check_for_aces).to be false
    end
    it "makes a value of ace 1 point instead of 11" do
      new_player.get_card(card1)
      new_player.get_card(card2)
      new_player.get_card(card3)
      new_player.check_for_aces
      expect(new_player.total).to eq(15)
    end
  end
end
