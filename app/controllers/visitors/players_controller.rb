module Visitors
	class PlayersController < VisitorsController
	  def show
	  	@player = Player.find(params[:id])
	  	@total_matches = Match.where(player_1: @player).or(Match.where(player_1: @player))
  		@matches_won = Match.where(player_1: @player).where(winner: @player).or(Match.where(player_2: @player).where(winner: @player))	
	  end
	end
end