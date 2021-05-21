module Admins
  class BackgroundsController < AdminsController
    before_action :set_background, only: [:edit, :update, :destroy]

    # GET /backgrounds
    def index
      @backgrounds = Background.all
    end

    # GET /backgrounds/new
    def new
      @background = Background.new
    end

    # GET /backgrounds/1/edit
    def edit
    end

    # POST /backgrounds
    def create
      @background = Background.new(background_params)

      if @background.save
        redirect_to edit_background_path(@background), notice: 'Background was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /backgrounds/1
    def update
      if @background.update(background_params)
        redirect_to edit_background_path(@background), notice: 'Background was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /backgrounds/1
    def destroy
      @background.destroy
      redirect_to backgrounds_url, notice: 'Background was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_background
        @background = Background.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def background_params
        params.require(:background).permit(:name, :background_image)
      end
  end
end