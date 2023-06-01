class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: :create

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    if user_signed_in?
      # Lógica para crear un comentario de un usuario registrado
      @comment = Comment.new(comment_params)

      respond_to do |format|
        if @comment.save
          format.html { redirect_to show_and_new_comment_article_path(@comment.article), notice: "Comment was successfully created." }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      # Lógica para crear un comentario anónimo
      @anonymous_comment = AnonymousComment.new(anonymous_comment_params)

      respond_to do |format|
        if @anonymous_comment.save
          format.html { redirect_to show_and_new_comment_article_path(@anonymous_comment.article), notice: "Comment was successfully created." }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:description, :user_id, :article_id)
    end

    def anonymous_comment_params
      params.require(:comment).permit(:description, :article_id)
    end
end
