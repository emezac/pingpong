class GamesController < InheritedResources::Base

  private

    def game_params
      params.require(:game).permit(:game, :date)
    end
end

