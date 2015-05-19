=begin
  blha blha

=end

def evalute(player_choice, computer_choice)
  if (player_choice == "p" && computer_choice == "s") || (computer_choice == "p" && player_choice == "r") || (computer_choice == "r" && player_choice == "p")
    computer_wins
  elsif computer_choice == player_choice
    puts "It's a tie!"
  else 
    player_wins
  end
end

def winning_message(computer_choice)
  case computer_choice
  when "p"
    "paper"
  when "s"
    "scissors"
  when "r"
    "rock"
  end
end




def player_wins
  puts "You win!!  Wooohoooo!"
end

def computer_wins
  puts "The computer won.  Too bad for you.  Now pay up WITH YOUR SOUL.  Gimmee gimmee!"
end

CHOICES = {"p" => "Paper", "s" => "Scissors", "r" => "Rock"}

loop do
  puts "Welcome to paper, rock, scissors!"

  begin
    puts "Pick one: p, r, s"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  computer_choice = CHOICES.keys.sample
  puts "The computer has chosen..." + winning_message(computer_choice)

  evalute(player_choice, computer_choice)
  puts "Do you want to play again?  (Y/N)"
  play_again = gets.chomp

  break if play_again == "n".downcase
    puts "Too bad.  I guess you think I'm gonna win the next time?  You're probably right."
  end






