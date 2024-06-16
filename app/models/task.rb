class Task < ApplicationRecord
  belongs_to :project

  enum :status, {next_to_do: "next_to_do", doing: "doing", complete: "complete"}
end
