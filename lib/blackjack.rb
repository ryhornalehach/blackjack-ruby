require_relative "card"
require_relative "deck"
require_relative "hand"

player = Hand.new
computer = Hand.new
# Your code here...

new_deck = Deck.new
new_deck.shuffle

2.times do
  player.get_card(new_deck.deck.pop)
end

2.times do
  computer.get_card(new_deck.deck.pop)
end


puts("Welcome to Blackjack!")
user_input = ''
while user_input.downcase != 's'
  if player.total <= 21
  user_input = player.players_turn("Player", new_deck)
  player.check_for_aces

elsif player.total > 21 && player.check_for_aces
    user_input = players_turn(player, new_deck)

  else
    abort("Bust! Game over... Your score is #{player.total}")
  end
end

computer.display_hand("Dealer")


while computer.total <= 17
  computer.get_card(new_deck.deck.pop)

  puts("Dealer was dealt #{computer.cards[computer.cards.length - 1].rank}#{computer.cards[computer.cards.length - 1].suit}")
  puts("Dealer score: #{computer.total}\n\n")
end

if computer.total > 21
  abort("Bust! You win! Player's score: #{player.total}. Computer's score: #{computer.total}")
end

puts("\nPlayer score: #{player.total}")
puts("Dealer score: #{computer.total}")
if player.total < computer.total
  puts("Dealer wins!")
elsif player.total > computer.total
  puts("Player wins!")
else
  puts("It's a tie!")
end
