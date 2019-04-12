class ScoreboardsController < InheritedResources::Base

  private

    def scoreboard_params
      params.require(:scoreboard).permit(:scoreplayer1, :scoreplayer2, :player_id)
    end
end

