require 'pry'

def sum_of_cards(cards)
  total = 0
  cards.map do |number, suit|
    if number =~ /Jack/ || number =~ /Queen/ || number =~ /King/ 
      total += 10
    elsif number =~ /Ace/
      if total <= 10
        total += 11
      else total += 1
      end
    else 
      total += number.to_i
    end
  end

#Correcting for first ace

if total > 21  
  cards.map do |number, suit|
    if cards.include?("Ace")
      total -= 9
      break
    end
  end
end

total
end

play_again = "y"

#Establish Deck

begin
  deck_numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "Jack", "Queen", "King", "Ace"]
  suits = ["Hearts", "Spades", "Clubs", "Diamonds"]
  deck = deck_numbers.product(suits)
  deck.shuffle!

  computer_cards = []
  computer_cards << deck.pop
  computer_cards << deck.pop

  player_cards = []
  player_cards << deck.pop
  player_cards << deck.pop


  puts "Computer: #{computer_cards[0]}, X"
  puts "Player: #{player_cards[0]}, #{player_cards[1]}"

#Player's turn

  while sum_of_cards(player_cards) < 21
    puts "What would you like to do?  Hit or Stay (h/s)?"
    player_choice = gets.chomp.downcase
    if player_choice == 'h'
      player_cards << deck.pop
      puts "Player: #{player_cards}.  Your total is #{sum_of_cards(player_cards)}"
    elsif sum_of_cards(player_cards) == 21
      "You got blackjack!!  You win!!"
    elsif player_choice == 's'
      break
    else 
      next
    end
  end

#Computer's turn

  while sum_of_cards(computer_cards) <= 16 && sum_of_cards(player_cards) <= 21
    computer_cards << deck.pop
  end

#Evaluation and Declaration of winner

  if sum_of_cards(player_cards) < 21 && sum_of_cards(computer_cards) <= 21
    if sum_of_cards(computer_cards) > sum_of_cards(player_cards)
      puts "The computer got #{computer_cards} for a total of #{sum_of_cards(computer_cards)}  \n The computer wins!"
    elsif sum_of_cards(computer_cards) < sum_of_cards(player_cards)
      puts "The computer got #{computer_cards} for a total of #{sum_of_cards(computer_cards)}  \n You won you lucky bastard!"
    else
      puts "It's a tie!"
    end
  elsif sum_of_cards(player_cards) > 21 
    puts "You busted, you bum."
  else 
    puts "The computer got #{computer_cards} for a total of #{sum_of_cards(computer_cards)}  \n You won!"
  end

#Ask to play again

puts "Do you want to play again? (Y/N)"
play_again = gets.chomp.downcase
system 'clear'
end until play_again == 'n'




