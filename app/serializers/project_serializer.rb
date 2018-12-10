class ProjectSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :created_at

  has_many :tasks
end
