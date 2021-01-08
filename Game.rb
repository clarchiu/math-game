require "./Player"

class Game 
  def initialize(questions)
    @questions = questions
    @players = [ Player.new, Player.new ]
  end

  def start 
    counter = 1
    while !gameover? do
      current = counter % 2 
      asker = current == 0 ? "Player 2" : "Player 1"
      question = get_question
      ask_question(asker, question[:str])
      check_answer(asker, current, question[:answer])
      puts "P1: #{@players[0].lives}/3 vs P2: #{@players[1].lives}/3"
      if gameover? 
        winner = @players[0].lives == 0 ? 1 : 0
        puts "Player #{winner + 1} wins with a score of #{@players[winner].lives}/3"
      else
        puts "----- NEW TURN -----"
      end 
      counter += 1
    end
    puts "----- GAMEOVER -----"
    puts "Goodbye!"
  end

  private

  def ask_question(asker, question)
    puts "#{asker}: #{question}"
    print "> "
  end

  def check_answer(asker, current, correct_answer)
    answerer = @players[current]
    answer = gets.chomp
    if answer.to_i == correct_answer
      puts "#{asker}: YES! You are correct."
    else 
      puts "#{asker}: Seriously? No!"
      answerer.lose_life
    end
  end

  def gameover?
    @players[0].dead? || @players[1].dead?
  end

  def get_question
    @questions[rand(20)]
  end
end