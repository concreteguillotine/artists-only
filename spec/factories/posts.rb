FactoryBot.define do
    factory :post do
        association :author, factory: :user
        link_to_example_image = "spec/fixtures/testimage.jpg"
        title { "Example Post" }
        image { Rack::Test::UploadedFile.new link_to_example_image, "image/jpg" }
        open { :true }
    end
end