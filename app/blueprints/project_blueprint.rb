class ProjectBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :description

  view :with_tasks do
    association :tasks, blueprint: TaskBlueprint
  end
end
