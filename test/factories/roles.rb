FactoryBot.define do
  factory :role do
    role { Role.roles.keys.sample }
    user
    project
  end
end
