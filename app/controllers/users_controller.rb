class UsersController < ApplicationController

  # GET /users/:id
  def index
    user = User.find(params[:id])
    @pictures = user.pictures.order('created_at DESC')
    render 'pictures/index'
  end

end
