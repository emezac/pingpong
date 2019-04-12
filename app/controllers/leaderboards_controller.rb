class LeaderboardsController < InheritedResources::Base

  private

    def leaderboard_params
      params.require(:leaderboard).permit(:ranking, :player_id)
    end
end

