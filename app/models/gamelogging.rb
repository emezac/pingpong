class Gamelogging < ApplicationRecord
  belongs_to :game
  belongs_to :player1, :class_name => 'Player'
  belongs_to :player2, :class_name => 'Player'
end
