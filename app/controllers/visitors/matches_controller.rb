module Visitors
	class MatchesController < VisitorsController
	  def show
	  	@match = Match.find(params[:id])
	  end
	end
end