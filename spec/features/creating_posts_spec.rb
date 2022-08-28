require "rails_helper"

RSpec.feature "Users can create new projects" do
    before do
        login_as(FactoryBot.create(:user))
    end

    scenario "with either text or an image, or both" do
        visit "/"

        click_link "New post"

        fill_in "Title", with: "Cool Project"
        attach_file("Image", "spec/fixtures/testimage.jpg")
        fill_in "Text", with: "This is my new project, add what you like!"
        page.check("Open?")
        click_button "Create Post"

        expect(page). to have_content "This post has been added!"

        within(".post") do
            expect(page).to have_content "Cool Project"
            expect(page).to have_content "user2"
            expect(page).to have_content "This is my new project, add what you like!"
            expect(page).to have_css("img[src*='testimage.jpg']")
            expect(page).to have_content "This post is open for editing, request to collaborate here!"
        end
    end
end
