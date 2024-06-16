class Role < ApplicationRecord
  belongs_to :user
  belongs_to :project

  enum :role, {manager: "manager", contributor: "contributor"}
end
