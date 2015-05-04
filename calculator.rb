def say(prompt)
  puts "-----#{prompt}-----"
end

def operation(num1, num2, operator)
  if operator == 1
    result = num1 + num2
  elsif operator == 2
    result = num1 - num2
  elsif operator == 3
    result = num1 * num2
  else
    result = num1 / num2
  end

puts "Your answer is #{result}.  I know, I'm brilliant, right??"
end


say("What's the first number?")
num1 = gets.chomp.to_f

say("What's your second number?")
num2 = gets.chomp.to_f

say("What would you like to do with your numbers?  1)  Add 2) Subtract 3) Multiply 4) Divide")
operator = gets.chomp.to_f

operation(num1, num2, operator)

