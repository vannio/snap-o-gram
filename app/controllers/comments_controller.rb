class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :require_author, only: [:edit, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  # GET /comments
  # GET /comments.json
  def index
    @picture = Picture.find(params[:picture_id])
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new
  end

  # GET /comments/1/edit
  def edit
    @picture = Picture.find(params[:picture_id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @picture = Picture.find(params[:picture_id])
    @comment = @picture.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.picture, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.picture, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.picture, notice: 'Comment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :user_id, :picture_id).merge(user_id: current_user.id)
    end

    def require_author
      unless set_comment.user == current_user
        flash[:alert] = "You are not the author!"
        redirect_to pictures_path # halts request cycle
      end
    end
end
