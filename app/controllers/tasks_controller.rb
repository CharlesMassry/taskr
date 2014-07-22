class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.user = current_user
    if task.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @task = find_task
  end

  def update
    task = find_task
    if task.update(task_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    task = find_task
    task.done = true
    task.save
    redirect_to dashboard_path
  end

  private

  def find_task
    Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
