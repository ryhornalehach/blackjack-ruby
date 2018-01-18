class Card
  # Your code here
  attr_reader :rank, :suit
  attr_accessor :value

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = 0
    process_card_value
  end

  private
  def process_card_value
    case @rank
    when 2
      @value = 2
    when 3
      @value = 3
    when 4
      @value = 4
    when 5
      @value = 5
    when 6
      @value = 6
    when 7
      @value = 7
    when 8
      @value = 8
    when 9
      @value = 9
    when 10, 'J', 'Q', 'K'
      @value = 10
    when 'A'
      @value = 11
    end
  end
end
