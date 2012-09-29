class PagesController < ApplicationController
  def home
    @users = User.all
    @projects = Project.all
  end
end
