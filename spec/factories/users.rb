FactoryBot.define do
    factory :user do
        sequence(:email) { |n| "test#{n}@example.com" }
        sequence(:username) { |x| "user#{x}" }
        password { "password" }
    end
end