class RoleBlueprint < Blueprinter::Base
  identifier :id

  fields :role
  association :user, blueprint: UserBlueprint
end
