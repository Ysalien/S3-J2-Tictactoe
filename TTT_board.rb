require 'colorize'

class Board
  attr_accessor :board

  def initialize #Les neufs cases avec les valeurs 1 à 9 pour éviter de taper 0 comme dans l'array
    @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def display_board #L'array du plateau de morpion
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} \n\n"
  end

  def play(array) #Cela va définir des arrays où il faudra nécessairement rentrer un chiffre entre 1 et 9. Et va substituer les chiffres d'origine par les X et les O.
    if @board[array[2]] == 1 || 2 || 3 || 4 || 5 || 6 || 7 || 8 || 9
      if array[1] == "X"
      @board[array[2]] = "X".blue #permet d'avoir les X colorés grâce à la gem colorize
      else
      @board[array[2]] = "O".red #idem
      end
    #else
    end
  end

  def victory? #Tout ce qu'on a défini en turn doit s'exécuter jusqu'à qu'une des solutions suivantes se présente.
    case # Case-when est une autre structure de condition applicable à la variable (victory? ici), ce qui va permettre
        # de checker si le joueur a atteint l'une des conditions (true) et va continuer de poursuivre le turn si c'est false
    when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != "1" && @board[1] != "2" && @board[2] != "3" #victoire à l'horizontal
      return true
    when @board[3] == @board[4] && @board[3] == @board[5] && @board[3] != "4" && @board[4] != "5" && @board[5] != "6" #victoire à l'horizontal
      return true
    when @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != "7" && @board[7] != "8" && @board[8] != "9" #victoire à l'horizontal
      return true
    when @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != "1" && @board[3] != "4" && @board[6] != "7" #victoire à la verticale
      return true
    when @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != "3" && @board[5] != "6" && @board[8] != "9" #victoire à la verticale
      return true
    when @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != "1" && @board[4] != "5" && @board[8] != "9" #victoire à la verticale
      return true
    when @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != "3" && @board[4] != "5" && @board[6] != "7" #victoire en diagonale
      return true
    when @board[1] == @board[4] && @board[1] == @board[7] && @board[1] != "2" && @board[4] != "5" && @board[7] != "8" #victoire en diagonale
      return true
    else
      return false
    end
  end
end
