class ProjectsController < ApplicationController
  def index
    projects = Project.all
    render json: ProjectSerializer.new(projects, { include: [:tasks] }).serialized_json
  end
end
