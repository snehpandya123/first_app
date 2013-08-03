class UsersController < ApplicationController
  def new
  	@usr = Usr.new
	@title = "Sign up"
  end
  def show
  	@usr = Usr.find(params[:id])
	@title = @usr.name
end
end

