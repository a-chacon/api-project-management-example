FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    status { Task.statuses.keys.sample }
    project
  end
end
