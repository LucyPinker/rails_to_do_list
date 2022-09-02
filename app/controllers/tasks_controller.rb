class TasksController < ApplicationController
  def index
    @task = Task.new
    @user = User.find(params[:user_id])
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to user_tasks_path, status: :see_other
    end
  end

  def create
    @task = Task.new(task_params)
    @task.user = User.find(params[:user_id])
    if @task.save
      redirect_to user_tasks_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to user_tasks_path, status: :see_other
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(status: params[:status])
      redirect_to user_tasks_path
    end
  end
  private

   def task_params
    params.require(:task).permit(:name, :status)
  end

end
