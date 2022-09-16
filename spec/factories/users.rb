FactoryBot.define do
    factory :user, aliases: [:author] do
        sequence(:email) { |n| "test#{n}@example.com" }
        sequence(:username) { |x| "user#{x}" }
        password { "password" }
        about { "" }
    end
end