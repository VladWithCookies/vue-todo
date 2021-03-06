class ProjectsController < ApplicationController
  def index
    projects = Project.all
    render json: ProjectSerializer.new(projects, { include: [:tasks] }).serialized_json
  end

  def create
    project = Project.create(title: 'New Project')
    render json: ProjectSerializer.new(project)
  end

  def update
    project = Project.find(params[:id])
    project.update(title: params[:title])
  end

  def destroy
    Project.destroy(params[:id])
  end
end
