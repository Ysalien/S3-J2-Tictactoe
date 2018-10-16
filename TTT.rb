require 'pry'
require 'colorize' #gem qui permet de colorer

require_relative 'TTT_board'
require_relative 'TTT_player'

class Game

  def initialize
    puts "Quel est le nom du premier joueur ?" #Définition du premier joueur : le nom(name_player) qui correspondra au name dans Player et la valeur(player_shape) qui correspondra au shape dans Player
    name_player_one = gets.chomp
    puts "#{name_player_one}, tu as les X."
    player_shape_one = "X"
    @player_one = Player.new(name_player_one, player_shape_one)

    puts "Quel est le nom du second joueur ?"
    name_player_two = gets.chomp
    puts "#{name_player_two}, tu as les O."
    player_shape_two = "O"
    @player_two = Player.new(name_player_two, player_shape_two)

    @players = [@player_one, @player_two] #On lie les deux joueurs dans une array pour appliquer l'ensemble des futurs méthodes pour les deux joueurs.
    @grid_board = Board.new #On fait apparaitre le plateau avec notre instance @object_board
  end

  def go #Les règles du jeu pour faire joli
    puts
    puts "Comment jouer ?"
    puts "Il faut indiquer des chiffres de 1 à 9 dans la case correspondante pour afficher son X ou son O."
    puts "Let's go! \n"
    gets.chomp
    self.turn #fais appelle à la classe dans la classe. Donc ici appelle la classe pour turn
  end

  def turn
    turns = 0 #Le turns commence à 0, on ajoute +1 après jusqu'à ce qu'un des deux joueurs gagne.

    while @grid_board.victory? == false do #On fait tout ce qu'il y a en dessous, tant que victory? n'est pas atteint
      @players.each { |player| #Il ne faut pas oublier d'appeler l'array des joueurs pour cela et de leur appliquer les lignes suivantes
        @grid_board.display_board #Affichage du plateau


        puts "***** TOUR #{turns + 1} *****".yellow #La structure chaque tour
        puts "#{player.name} ! Choisis ta case."   #On appliquer le .name de la classe Player au player(les deux qu'on a lié juste avant.)
        n = gets.chomp.to_i   #On enregistre la case dans la variable n cad dans les infos du player
          until n > 0 && n < 10 #Evite qu'on entre un numéro autre que les chiffres de 1 à 9, sinon ça demande de renseigner un bon numéro (se répète grâce à until)
            puts "Veuillez renseigner un bon numéro :"
            n = gets.chomp.to_i
          end

        n = n - 1 #On retire 1 pour que ça corresponde à l'index (sans ça on commence à 0 et pas à 1)

        @info_player = [player.name, player.player_color, n] #enregistre les infos données au cours de la partie
        @grid_board.play(@info_player)

        if @grid_board.victory? #Les conditions de victory? sont remplies alors on applique deux cas de figure (win / égalité)
          @grid_board.display_board # affiche le plateau gagnant
          puts "********************************".yellow
          puts "  Bravo #{player.name}, tu as gagné !"
          puts "********************************".yellow
          puts "Une autre partie? (Y or N)" #accéder à une autre partie
            answer = gets.chomp #On demande le oui ou le non
            if answer == "Y" #Si la réponse est oui (Y)
              Game.new.go #On relance le jeu avec le Game.new.go
            else
              puts "Game over!" #Sinon c'est fini
            end
          break # on sort de la boucle si c'est le joueur a gagné.
        end

      turns += 1 # On incrémente le turns pour atteindre 9

        if turns == 9 # Les conditions de victory? n'ont pas été remplies mais on a fini de remplir le plateau, c'est l'égalité
        @grid_board.display_board #Affiche le plateau de l'égalité
        puts "***************".yellow
        puts " Wow, égalité "
        puts "***************".yellow
        puts "Une autre partie? (Y or N)"
          answer = gets.chomp #idem qu'avant
          if answer == "Y"
            Game.new.go
          else
            puts "Game over!"
          end
        break
      end
    } #fin des lignes à appliquer à chacun des joueurs inclus dans l'array players

    end #Fin de la boucle while avec l'atteinte de la condition de victory? en true

  end #fin de turn

end

Game.new.go # On lance le jeu en lançant la classe Game et en lui appliquant la méthode go qui inclus le turn grâce à self
