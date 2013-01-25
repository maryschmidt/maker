FactoryGirl.define do

  factory :goal do
    goal "goal"
    user
  end

  factory :project do
    title "title"
    description "description"
    user
  end

  factory :step do
    name "name"
    detail "detail"
    tip "tip"
    project
  end

  factory :comment do
    body "Hello"
    user
    project
  end

end
