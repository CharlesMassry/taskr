class TasksController < ApplicationController
  respond_to :js, :html, :json

  def index
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    @task.save
    respond_with(@task)
  end

  def update
    @task = find_task
    @task.update!(task_params)
    respond_with(@task)
  end

  def destroy
    task = find_task
    @task_id = task.id
    task.destroy
    respond_with(@task_id)
  end

  private

  def find_task
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :done)
  end
end
