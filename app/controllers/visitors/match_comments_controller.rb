module Visitors
  class MatchCommentsController < VisitorsController
    before_action :set_match_comment

    # GET /match_comments
    def index
      @match_comments = MatchComment.all
    end

    # GET /match_comments/1
    def show
    end

    # GET /match_comments/new
    def new
      @match_comment = MatchComment.new
    end

    # GET /match_comments/1/edit
    def edit
    end

    # POST /match_comments
    def create
      @match_comment = MatchComment.new(match_comment_params)

      if @match_comment.save
        redirect_to @match_comment, notice: 'Match comment was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /match_comments/1
    def update
      if @match_comment.update(match_comment_params)
        redirect_to @match_comment, notice: 'Match comment was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /match_comments/1
    def destroy
      @match_comment.destroy
      redirect_to match_comments_url, notice: 'Match comment was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_match_comment
        @match_comment = MatchComment.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def match_comment_params
        params.require(:match_comment).permit(:descrption, :match_id)
      end
  end
