class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]
  before_action :set_picture, only: [:create, :destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(user_id: current_user.id, picture_id: @picture.id)
    redirect_to pictures_path if @like.save
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    redirect_to pictures_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    def set_picture
      @picture = Picture.find(params[:picture_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:user_id, :picture_id)
    end
end
