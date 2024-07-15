class TaskBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :description, :status
end
