module Admins
  class MatchesController < AdminsController
    before_action :get_categories
    before_action :set_match, only: [:edit, :update, :destroy]

    # GET /matches
    def index
      @matches = Match.order(:round, :category_id)

    end

    # GET /matches/1
    def show
    end

    # GET /matches/new
    def new
      @match = Match.new
    end

    # GET /matches/1/edit
    def edit
    end

    # POST /matches
    def create
      @match = Match.new(match_params)
      if @match.save
        redirect_to edit_match_path(@match), notice: 'Match was successfully created.'
      else
        render :new
      end
        
    end

    # PATCH/PUT /matches/1
    def update
      if @match.update(match_params)
        notice = 'Match was successfully updated.'
      else
        notice = @match.errors.full_messages.join(". ") << "."
      end
        redirect_to edit_match_path(@match), notice: notice
    end

    # DELETE /matches/1
    def destroy
      @match.destroy
      redirect_to matches_url, notice: 'Match was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def get_categories
        @select_categories = []
        @select_players = []
        Category.all.each do |category|
          @select_categories.push([category.title, category.id])
        end
        Player.all.each do |player|
          @select_players.push([player.name, player.id])
        end
      end
      def set_match
        @match = Match.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def match_params
        params.require(:match).permit(:date, :category_id, :player_1_id, :player_2_id, :round, :winner_id)
      end
  end
end