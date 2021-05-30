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
		
		def visitor_category_suggestion
			@category = Category.find(params[:id])
	  	@suggestion = @category.suggestion.build(title: params[:title], description: params[:description])
	  	if @suggestion.save
				notice = "Suggestion sent"
	  	else
				notice = "Something went wrong & we couldn't send your suggestion"
	  	end
	  		redirect_to visitor_category_path(@category), notice: notice
		end
	end 
end