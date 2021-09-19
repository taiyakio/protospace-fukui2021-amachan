class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :show]

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

  def edit
    if user_signed_in? && current_user.id != @prototype.user_id
      redirect_to action: :index
    end
    unless user_signed_in?
      redirect_to :new_user_session_path
    end
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def prototype_params
    params.require(:prototype).permit(:name, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
