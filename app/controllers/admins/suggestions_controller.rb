module Admins
  class SuggestionsController < AdminsController
    before_action :suggestable_types
    before_action :set_suggestion, only: [:update, :destroy]

    # GET /suggestions
    def index
      @suggestions = Suggestion.all.order(:status, :updated_at)
    end

    # PATCH/PUT /suggestions/1
    def update
      if @suggestion.update(suggestion_params)
        redirect_to suggestions_path
      else
        redirect_to suggestions_path , notice: 'Something went wrong! :('
      end
    end

    # DELETE /suggestions/1
    def destroy
      @suggestion.destroy
      redirect_to suggestions_url, notice: 'Suggestion was successfully destroyed.'
    end

    private
      def suggestable_types
        @suggestable_types = ["players", "matches", "categories"].freeze
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_suggestion
        @suggestion = Suggestion.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def suggestion_params
        params.require(:suggestion).permit(:title, :description, :status, :suggestable_type, :suggestable_id)
      end
  end
end