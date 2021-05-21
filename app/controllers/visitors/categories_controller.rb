module Visitors
	class CategoriesController < VisitorsController

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
      p "*+*" * 30
      p @matches.map { |e| e.round  }
      p "*+*" * 30
		end

	end 
end