class TasksController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice] = "Task has been created"
      redirect_to project_path(@project)
    else
      flash[:notice] = "Task has not been created"
      redirect_to project_path(@project)
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_url(@project), notice: "Task has been updated!" }
      else 
        format.html {redirect_to project_url(@project), alert: "Task has not been updated!"}
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end
    

    private

    def task_params
      params.require(:task).permit(:name, :description, :status)
    end
    
end
