module Admins
  class MatchesController < AdminsController
    before_action :set_match, only: [:edit, :update, :destroy]
    # GET /matches
    def index
      @matches = Match.order(:round, :category_id)

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
        redirect_to edit_match_path(@match)
      else
        render :new
      end
        
    end

    # PATCH/PUT /matches/1
    def update
      if @match.update(match_params)
        notice = nil
      else
        notice = @match.errors.full_messages.join(" - ")
      end
        redirect_to edit_match_path(@match), notice: notice
    end

    # DELETE /matches/1
    def destroy
      @match.destroy
      redirect_to matches_url, notice: 'Match was successfully destroyed.'
    end

    def search_matches
      rounds = params[:match][:rounds_filter].reject { |r| r.empty? }
      result = Match.all
      if not params[:category_filter].empty?
        result = Match.where(category_id: params[:category_filter])
      end
      if not rounds.empty?
        result = result.where(round: rounds)
      end
      @matches = result
    end
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_match
        @match = Match.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def match_params
        params.require(:match).permit(:date, :category_id, :player_1_id, :player_2_id, :round, :winner_id, :player_1_civilization, :player_2_civilization)
      end
  end
end