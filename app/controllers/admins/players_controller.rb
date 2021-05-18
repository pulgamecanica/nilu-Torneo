 module Admins
  class PlayersController < AdminsController
    before_action :select_categories
    before_action :set_player, only: [:edit, :update, :destroy]

    # GET /players
    def index
      @players = Player.order(:category_id)
    end

    # GET /players/new
    def new
      @player = Player.new
    end

    # GET /players/1/edit
    def edit
      @opponents = []
      @player.category.players.where.not(id: @player.id).each do |player|
        @opponents.push([player.name, player.id])
      end
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

    private
      def select_categories
        @select_categories = []
        Category.all.each do |category|
          category_string = category.title + "(" + category.min_rank.to_s +  "-" + category.max_rank.to_s + ")"
          @select_categories.push([category_string, category.id])
        end
      end
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