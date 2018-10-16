class Player
  attr_accessor :name, :player_color

  def initialize(name, player_color)
    @name = name #Le nom à retourner lors de chaque tour
    @player_color = player_color #La représentation des X et des O
  end
end

#La classe player est là pour faire le lien entre ce qu'on a défini dans la classe Game
#On va pouvoir utiliser le .name pour afficher le nom de l'un des players définis
#Et le player_color correspond au X et au O à placer dans le plateau de jeu, et qui va s'intéger aux infos du joueur dans turn
