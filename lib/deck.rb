class Deck
  attr_reader :deck
  # Your code here
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITS = ['♣', '♠', '♥', '♦']

  def initialize
    @deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @deck << Card.new(rank, suit)
      end
    end
  end

  def shuffle
    @deck = @deck.shuffle
  end
end
