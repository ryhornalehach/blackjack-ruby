class Hand
  # Your code here
  attr_reader :cards
  attr_accessor :total

  def initialize
    @cards = []
    @total = 0
  end

  def get_card(card)
    @cards << card
    @total += card.value
  end

  def display_hand(member)
    return_string = ''
    puts('')
    @cards.each do |card|
      print("#{member} was dealt #{card.rank}#{card.suit}\n")
      return_string << "#{card.rank}#{card.suit}, "
    end
    print("#{member} score: #{@total}\n")
    return_string << @total.to_s
    return return_string
  end

  def players_turn(member, deck_placeholder)
    display_hand("Player")
    print("\nHit or stand (H/S): ")
    user_input = gets.chomp
    if user_input.downcase == 'h'
      get_card(deck_placeholder.deck.pop)
    end
    return user_input.downcase
  end

  def check_for_aces
    status = false
    if @total > 21
      @cards.each do |card|
        if card.rank == 'A' && card.value == 11
          card.value = 1
          @total -= 10
          status = true
          break
        end
      end
    end
    status
  end
end
