FactoryBot.define do
  factory :project do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }

    factory :project_with_tasks do
      transient do
        tasks_count { 5 }
      end

      after(:create) do |project, context|
        create_list(:task, context.tasks_count, project:)
      end
    end
  end
end
