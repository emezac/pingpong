class GameloggingsController < InheritedResources::Base

  private

    def gamelogging_params
      params.require(:gamelogging).permit(:newschronic, :eventime, :scorepl1, :scoreplayer2, :finalpoints, :game_id, :player1_id, :player2_id)
    end
end

