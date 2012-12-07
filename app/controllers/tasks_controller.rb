class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
   @user = User.find(params[:user_id])
   if params[:search]
    @tasks = Task.where("title = ?", params[:search])
   else
    @tasks = Task.order(params[:order]).where(:user_id => params[:user_id])
   end
    respond_to do |format|sk = Task.find(params[:user_id])
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end
  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @user = User.find(params[:user_id])
   # @task = @user.task.find(params[:id])
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @user = User.find(params[:user_id])
    @task = @user.tasks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @user = User.find(params[:user_id])
    @task = @user.task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.find(params[:user_id])
    @task = @user.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to [@user, @task], notice: 'Task was successfully created.' }
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
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @user = User.find(params[:user_id])
    @task = @user.tasks.find(params[:user_id])
   # @task = Task.find(params[:id])
   # @task.destroy
     @user.tasks.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
