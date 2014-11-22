# This is a Number guessing game
require 'active_support/inflector'

class GuessingGame
  def initialize
    @count = 0
    @computer_guess = rand(1..100)
    puts "I am thinking of a number between 1 and 100 \nSo whats your first guess?"
  end

  def round
    @player_guess = gets.chomp.to_i
    @count += 1
    win if @player_guess == @computer_guess
    lose if @count == 5
    if @player_guess > @computer_guess
      count
      guesses_left
      random_game
    else
      count
      puts 'Lets try again your guess too small.'
      guesses_left
      random_game
    end
  end

  def win
    puts "You got it in #{@count} guesses."
  end

  def lose
    puts "GAME OVER \nThe answer was #{@computer_guess}"
  end

  def bigger #reads "Make A GIGGER GUESS"
    puts "Make A\n\nB\nI  /\\\nG /  \\\nR/_  _\\\nE |__|  \nR\n\nGUESS"
  end

  def smaller #reads "make a smaller guess"
    puts "make a\ns  ||\nm  ||\na  ||\nl  ||\nl  ||\ne \\  /\nr  \\/\nguess"
  end

  def guesses_left
    puts "You have #{5 - @count} #{'guess'.pluralize(5 - @count)} left."
  end

  def count
    @count += 1
  end

  def game
    computer_num
    round
  end

  def plauralize(word, count)
    word.to_s
    if count == 1
      word.pluralize(1)
    elsif count > 1
      word.pluralize
    end
  end
end

play = GuessingGame.new
play.game
