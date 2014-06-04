# This is a Number guessing game
class Guessing
  def computer_num
    @random_number = rand(100) + 1
    puts 'I am thinking of a number between 1 and 100.
          So whats you first guess?'
    @count = 0
  end

  def random_game
    @random_guess = gets
    @count = @count + 1
    if @random_number == @random_guess.to_i
      puts 'You got it in ' + @count.to_s + ' guesses.'
    elsif @count == 5
      puts 'GAME OVER
      The answer was ' + @random_number.to_s
    elsif @random_guess.to_i > @random_number
      puts 'Lets try again your guess too big.
      You have ' + (5 - @count).to_s + ' guesses left.'
      random_game
    else
      puts 'Lets try again your guess too small.
      You have ' + (5 - @count).to_s + ' guesses left.'
      random_game
    end
  end

  def game
    computer_num
    random_game
  end
end

play = Guessing.new
play.game
