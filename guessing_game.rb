# This is a Number guessing game
require 'active_support/inflector'

class GuessingGame
  def initialize
    @count = 0
    @computer_guess = rand(1..100)
  end

  def round
    puts "I am thinking of a number between 1 and 100 \nYou have get 5 guesses. Whats your first guess?" if @count == 0
    human_guess = gets.chomp.to_i
    outcome(human_guess, @computer_guess)
    guesses_remaining
  end

  def play_again
    puts "would you like to play again? (y/n)"
    responce = gets.chomp
    if responce == 'y'
      initialize
    elsif responce == 'n'
      puts "thanks for playing"
      exit
    end
  end

  def win
    puts "You got it in #{@count} guesses."
    play_again
  end

  def lose
    puts "GAME OVER\nThe answer was : #{@computer_guess}"
    play_again
  end

  def outcome(human_guess, computer_guess) #directions are smaller or bigger
    if computer_guess == human_guess
      win && play_again
    elsif @count >= 5
      lose
    elsif computer_guess < human_guess # smaller
      puts "make a\n    __\ns  |  |\nm  |  |\na  |  |\nl__|  |__\nl\\      /\ne \\    /\nr  \\  /\n    \\/\nguess"
    elsif computer_guess > human_guess # bigger
      puts "Make A\n    /\\\nB  /  \\\nI /    \\\nG/__  __\\\nR  |  |\nE  |  |\nR  |  |\n   |__|\nGUESS"
    else
      puts "You made an illegal move, guess again."
      @count -= 1
      round
    end
  end

  def guesses_remaining
    puts "You have #{5 - @count} #{'guess'.pluralize(5 - @count)} left." if @count < 5
    @count += 1
    round
  end
end

play = GuessingGame.new
play.round
