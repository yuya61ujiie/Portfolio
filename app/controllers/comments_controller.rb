class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show update destroy ]
  before_action :set_spot
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = @spot.comments.includes([ :user ]).page(params[:page]).per(5)
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = current_user.comments.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to spot_comment_path(@spot, @comment), notice: "コメントを投稿しました" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to spot_comment_path(@spot, @comment), notice: "コメントを修正しました" }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to spot_comments_path(@spot), status: :see_other, notice: "コメントが削除されました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_spot
      @spot = Spot.find(params[:spot_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:scene, :start_at, :finish_at, :rating, :title, :body).merge(user_id: current_user.id, spot_id: params[:spot_id])
    end
end
