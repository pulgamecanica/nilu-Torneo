module Visitors
	class PlayersController < VisitorsController
	  def show
	  	@player = Player.find(params[:id])
	  end
	end
end