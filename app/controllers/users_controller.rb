class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @profile = user.profile
    @affiliation =user.affiliation
    @director = user.director
    @prototypes = user.prototypes
  end
end
