class TaskSerializer
  include FastJsonapi::ObjectSerializer

  attributes :content, :done, :priority, :deadline
end
