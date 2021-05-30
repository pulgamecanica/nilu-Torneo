module Visitors
	class PlayersController < VisitorsController
	  def show
	  	@player = Player.find(params[:id])
	  	@total_matches = Match.where(player_1: @player).or(Match.where(player_1: @player))
  		@matches_won = Match.where(player_1: @player).where(winner: @player).or(Match.where(player_2: @player).where(winner: @player))	
	  end
	  def visitor_like_player
      @player = Player.find(params[:id])
      @player.likes = @player.likes.to_i + 1
      if @player.save
        notice = "#{@player.name} got +1 like and now has #{@player.likes}"
      end
        redirect_to visitor_player_path(@player)
		end
		def visitor_player_suggestion
			@player = Player.find(params[:id])
	  	@suggestion = @player.suggestion.build(title: params[:title], description: params[:description])
	  	if @suggestion.save
				notice = "Suggestion sent"
	  	else
				notice = "Something went wrong & we couldn't send your suggestion"
	  	end
	  		redirect_to visitor_player_path(@player), notice: notice
		end
	end
end