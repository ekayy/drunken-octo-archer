FactoryGirl.define do
  factory :user do
    email    "user@example.com"
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :profile do
    content "Lorem ipsum"
    title "Test"
    user
  end
end
