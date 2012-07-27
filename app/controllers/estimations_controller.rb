class EstimationsController < ApplicationController
  # GET /estimations
  # GET /estimations.json
  def index
    @estimations = Estimation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @estimations }
    end
  end

  # GET /estimations/1
  # GET /estimations/1.json
  def show
    @estimation = Estimation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @estimation }
    end
  end

  # GET /estimations/1/edit
  def edit
    @estimation = Estimation.find(params[:id])
  end

  # POST /estimations
  # POST /estimations.json
  def create
    @estimation = Estimation.new(params[:estimation])

    respond_to do |format|
      if @estimation.save
        format.html { redirect_to @estimation, notice: 'Estimation was successfully created.' }
        format.json { render json: @estimation, status: :created, location: @estimation }
      else
        format.html { render action: "new" }
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /estimations/1
  # PUT /estimations/1.json
  def update
    @estimation = Estimation.find(params[:id])

    respond_to do |format|
      if @estimation.update_attributes(params[:estimation])
        format.html { redirect_to @estimation, notice: 'Estimation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @estimation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estimations/1
  # DELETE /estimations/1.json
  def destroy
    @estimation = Estimation.find(params[:id])
    @estimation.destroy

    respond_to do |format|
      format.html { redirect_to estimations_url }
      format.json { head :no_content }
    end
  end
end
