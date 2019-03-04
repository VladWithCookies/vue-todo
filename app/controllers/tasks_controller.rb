class TasksController < ApplicationController
  def create
    task = Task.create(task_params)
    render json: TaskSerializer.new(task)
  end

  private

  def task_params
    params.permit(:project_id, :content)
  end
end
