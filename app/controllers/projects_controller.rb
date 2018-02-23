class ProjectsController < ApplicationController
  before_action :set_project, only: %i(update destroy)

  def index
    projects = Project.all
    render json: projects
  end

  def create
    project = Project.create(title: params[:title])
    render json: project
  end

  def update
    @project.update(title: params[:title])
    render json: @project
  end

  def destroy
    @project.destroy
    render json: @project
  end

  private

  def set_project
    @project ||= Project.find(params[:id])
  end
end
