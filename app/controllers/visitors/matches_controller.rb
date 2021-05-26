module Visitors
	class MatchesController < VisitorsController
	  def show
	  	@match = Match.find(params[:id])
	  end
	  def visitor_like_match
	  	@match = Match.find(params[:id])
      @match.likes = @match.likes.to_i + 1
      if @match.save
        notice = " +1 like and now has #{@match.likes}"
      end
      redirect_to visitor_match_path(@match)
	  end
	  def visitor_vote_player
	  	@match = Match.find(params[:id])
	  	if not params[:vote_player].empty?
		  	votePlayer = Player.find(params[:vote_player])
		  	if votePlayer.eql? @match.player_1
		  		@match.vote_player_1 =  @match.vote_player_1.to_i + 1
		  	elsif votePlayer.eql? @match.player_2
		  		@match.vote_player_2 =  @match.vote_player_2.to_i + 1
		  	end
		  	@match.save
		  end
      redirect_to visitor_match_path(@match)
	  end
	end
end


