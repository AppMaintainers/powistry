class QueriesController < ApplicationController
  def index
    @search = Task.search(params[:q])
    @tasks = @search.result
    #redirect_to(:action=>:index)
  end

  def search
  end
 
end
