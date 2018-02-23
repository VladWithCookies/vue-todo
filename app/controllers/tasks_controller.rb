class TasksController < ApplicationController
  before_action :set_task, only: %i(update destroy)

  def index
    render json: Task.all
  end

  def create
    task = Task.create(
      content: params[:content],
      project_id: params[:project_id]
    )
    render json: task
  end

  def update
    @task.update(task_params)
    render json: @task
  end

  def destroy
    @task.delete
    render json: @task
  end

  private

  def set_task
    @task ||= Task.find(params[:id])
  end

  def task_params
    params.permit(:content, :priority, :done, :deadline)
  end
end
