# This is a Number guessing game
require 'active_support/inflector'

class GuessingGame
  def initialize
    @count = 0
    @computer_guess = rand(1..100)
  end

  def play
    intro
    round
  end

  def round
    print "Your guess : "
    human_guess = gets.chomp.to_i
    outcome(human_guess, @computer_guess)
    guesses_remaining
  end

  def outcome(human_guess, computer_guess) #directions are smaller or bigger
    if computer_guess == human_guess
      win && play_again
    elsif @count >= 5
      lose
    elsif computer_guess > human_guess # bigger
      bigger
    elsif computer_guess < human_guess # smaller
      smaller
    else
      puts "You made an illegal move, guess again."
      @count -= 1
      round
    end
  end

  def intro
    puts "********************************************************************"
    puts "**                                                                **"
    puts "**                    WELCOME TO GUESSING GAME                    **"
    puts "**                         by: Chet Corey                         **"
    puts "**                                                                **"
    puts "**             Guess my number it is between 1 and 100            **"
    puts "**                   I am giving you 5 chances                    **"
    puts "**                    Whats your first guess?                     **"
    puts "**                                                                **"
    puts "********************************************************************"
  end

  def win
    puts "************************"
    puts "**                    **"
    puts "**       WINNER       **"
    puts "**                    **"
    puts "************************"
  end

  def lose
    puts "************************"
    puts "**                    **"
    puts "**      GAME OVER     **"
    puts "**                    **"
    puts "************************"
  end

  def bigger
    puts "========================"
    puts "||    guess bigger    ||"
    puts "||         /\\         ||"
    puts "||        /  \\        ||"
    puts "||       /    \\       ||"
    puts "||      /__  __\\      ||"
    puts "||        |  |        ||"
    puts "||        |  |        ||"
    puts "||        |__|        ||"
    puts "========================"
  end

  def smaller
    puts "========================"
    puts "||    guess smaller   ||"
    puts "||         __         ||"
    puts "||        |  |        ||"
    puts "||        |  |        ||"
    puts "||      __|  |__      ||"
    puts "||      \\      /      ||"
    puts "||       \\    /       ||"
    puts "||        \\  /        ||"
    puts "||         \\/         ||"
    puts "========================"
  end

  def guesses_remaining
    @count += 1
    puts "You have #{5 - @count} #{'guess'.pluralize(5 - @count)} left." if @count < 5
    round
  end
end

GuessingGame.new.play

# def play_again
#   puts "would you like to play again? (y/n)"
#   responce = gets.chomp
#   if responce == 'y'
#     GuessingGame.new.play
#   elsif responce == 'n'
#     puts "thanks for playing"
#     exit
#   end
# end
