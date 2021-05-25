module Visitors
	class CategoriesController < VisitorsController
    before_action :visitor_get_random_background
		
		def show
			@category = Category.find(params[:id])
			@players = Player.where(category_id: params[:id]).order(:rank)
			@matches = Match.where(category_id: params[:id])
		end
		
		def visitor_search_players
      @players = Player.where(category_id: params[:category_id]).where("lower(name) LIKE ?", "%#{params[:search].downcase}%").order(:rank)
		end

		def visitor_search_matches
			rounds = params[:match][:rounds_filter].reject { |r| r.empty? }
      @matches = Match.where(category_id: params[:category_id])
      if not rounds.empty?
        @matches = @matches.where(round: rounds)
      end
		end

		def visitor_get_random_background
			@background = Background.get_random_background
		end
		def visitor_like_player
			puts "*** :(***"*10
      @player = Player.find(params[:id])
      @player.likes = @player.likes.to_i + 1
      if @player.save
        notice = "#{@player.name} got +1 like and now has #{@player.likes}"
      end
        redirect_to visitor_category_path(@player.category)
		end
	end 
end