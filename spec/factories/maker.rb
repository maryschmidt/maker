FactoryGirl.define do

  factory :goal do
    goal "goal"
    remind_me true
    frequency "1 week"
    status false
    user
  end

  factory :project do
    title "title"
    description "description"
    user
  end

  factory :comment do
    body "Hello"
    user
    project
  end

end
