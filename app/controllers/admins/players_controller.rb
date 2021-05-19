 module Admins
  class PlayersController < AdminsController
    before_action :set_player, only: [:edit, :update, :destroy]

    # GET /players
    def index
      @players = Player.order(:rank)
    end

    # GET /players/new
    def new
      @player = Player.new
    end

    # GET /players/1/edit
    def edit
      @matches = Match.all.where(player_1_id: @player.id).or(Match.all.where(player_2_id: @player.id ))
      @new_match = @player.player_1_matches.build(player_1: @player, category: @player.category) 
    end

    # POST /players
    def create
      @player = Player.new(player_params)
      if @player.save
        redirect_to edit_player_path(@player), notice: 'Player was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /players/1
    def update
      if @player.update(player_params)
        notice = 'Match was successfully updated.'
      else
        notice = @match.errors.full_messages.join(". ") << "."
      end
        redirect_to edit_player_path(@player), notice: notice
    end
    # DELETE /players/1
    def destroy
      @player.destroy
      redirect_to players_url, notice: 'Player was successfully destroyed.'
    end

    def search_players
      query = params[:search]
      results = Player.where("lower(name) LIKE ?", "%#{query.downcase}%")
      if params[:filter].empty?
        @players = results
      else
        @players = results.where(category_id: params[:filter])
      end 
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_player
        @player = Player.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def player_params
        params.require(:player).permit(:name, :category_id, :bio, :rank, :age, :birthday, :profile_image)
      end
  end
end