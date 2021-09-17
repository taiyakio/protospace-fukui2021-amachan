class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @profile = user.profile
    @affiliation =user.affiliation
    @director = user.director
    @tweets = user.tweets
  end
end
