class GameroundsController < InheritedResources::Base

  private

    def gameround_params
      params.require(:gameround).permit(:round, :game_id)
    end
end

