FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    factory :user_with_projects do
      transient do
        projects_count { 5 }
      end

      after(:create) do |user, context|
        create_list(:role, context.projects_count, user:)
      end
    end
  end
end
