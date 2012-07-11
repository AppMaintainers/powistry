class ComplexitiesController < ApplicationController
  # GET /complexities
  # GET /complexities.json
  def index
    @complexities = Complexity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @complexities }
    end
  end

  # GET /complexities/1
  # GET /complexities/1.json
  def show
    @complexity = Complexity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @complexity }
    end
  end

  # GET /complexities/new
  # GET /complexities/new.json
  def new
    @complexity = Complexity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @complexity }
    end
  end

  # GET /complexities/1/edit
  def edit
    @complexity = Complexity.find(params[:id])
  end

  # POST /complexities
  # POST /complexities.json
  def create
    @complexity = Complexity.new(params[:complexity])

    respond_to do |format|
      if @complexity.save
        format.html { redirect_to @complexity, notice: 'Complexity was successfully created.' }
        format.json { render json: @complexity, status: :created, location: @complexity }
      else
        format.html { render action: "new" }
        format.json { render json: @complexity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /complexities/1
  # PUT /complexities/1.json
  def update
    @complexity = Complexity.find(params[:id])

    respond_to do |format|
      if @complexity.update_attributes(params[:complexity])
        format.html { redirect_to @complexity, notice: 'Complexity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @complexity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /complexities/1
  # DELETE /complexities/1.json
  def destroy
    @complexity = Complexity.find(params[:id])
    @complexity.destroy

    respond_to do |format|
      format.html { redirect_to complexities_url }
      format.json { head :no_content }
    end
  end
end
