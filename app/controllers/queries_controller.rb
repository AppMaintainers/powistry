class QueriesController < ApplicationController
  def index
    @search = Task.search(params[:q])
    @tasks = @search.result
  end

  def search
  end
 
end
