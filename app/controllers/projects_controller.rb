class ProjectsController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end
end
