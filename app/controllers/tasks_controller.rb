class TasksController < ApplicationController

  before_filter :authenticate_user!

  # GET /tasks
  # GET /tasks.json
  def index
    @project = Project.find(params[:project_id])
    @tasks = @project.tasks
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end
  

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(params[:task])
            
    respond_to do |format|
      if @task.save
        unless params[:complexity_id] == 0
          est = Estimation.find_or_create_by_user_id_and_task_id(current_user.id, @task.id)
          est.complexity_id = params[:complexity_id]
          est.save
        end
        
        if params[:commit] == "Save & New"
          format.html { redirect_to new_project_task_path(@project), notice: 'Task was successfully created.' }         
        end
        format.html { redirect_to project_tasks_url, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        unless params[:complexity_id]==0
          est = Estimation.find_or_create_by_user_id_and_task_id(current_user.id, @task.id)
          est.complexity_id = params[:complexity_id]
          est.save
        end
        format.html { redirect_to project_tasks_url, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
    
end
