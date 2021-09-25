class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :matched_user, only: [:edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
      prototype = Prototype.find(params[:id])
      prototype.destroy
      redirect_to root_path
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def matched_user
    if  current_user.id != @prototype.user_id
      redirect_to action: :index
    end
  end
end
