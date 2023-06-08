module Mastermind
  class Mastermind
    def initialize(player1, player2, rounds)
      @player1 = player1
      @player2 = player2
    end

    def play
      until @rounds == 0
        play_round(@player1)
        play_round(@player2)
      end
    end
  
    def play_round(code_picker)
      @game_board = Board.new(code_picker.get_passcode)
    end
  end

  class Board
    def initialize(passcode)
      @passcode = passcode
      show_passcode(@passcode)
    end 

    def show_passcode(passcode)
      passcode.each { |element| show_code_peg(element)}
      puts
    end

    def show_code_peg(peg)
      print "\e[31m#{peg}\e[0m"
    end
  end

  class Player
  end

  class HumanPlayer < Player
    def get_passcode
      puts "Enter passcode"  
      print "Must be 4 colors long: "
      gets.chomp.split("")
    end
  end

  class CPUPlayer < Player
  end
end

game = Mastermind::Mastermind.new(Mastermind::HumanPlayer.new, Mastermind::CPUPlayer.new)
game.play