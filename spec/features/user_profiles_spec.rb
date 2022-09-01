require "rails_helper"

RSpec.feature "Users have profiles" do
    let!(:user) { FactoryBot.create(:user) }

    before do
        login_as(user)
        visit "/"
        click_link "New post"

        fill_in "Title", with: "Cool Project"
        attach_file("Image", "spec/fixtures/testimage.jpg")
        fill_in "Text", with: "This is my new project, add what you like!"
        page.check("Open?")
        click_button "Create Post"
    end

    scenario "they can visit their profile and see their own posts" do

        click_link "Your profile"

        expect(page).to have_content "This is your profile"

        within(".posts") do
            expect(page).to have_content "Cool Project"
        end
    end
end



