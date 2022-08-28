require "rails_helper"

RSpec.feature "Users can create new projects" do
    let!(:user1) { FactoryBot.create(:user, username: "user1") }
    let!(:user2) { FactoryBot.create(:user, username: "user2") }

    before do
        login_as(user1)
        visit "/"
        click_link "New post"
        fill_in "Title", with: "Cool Project"
        attach_file("Image", "spec/fixtures/testimage.jpg")
        fill_in "Text", with: "This is my new project, add what you like!"
        page.check("Open?")
        click_button "Create Post"
    end

    scenario "only the OP can delete posts" do
        expect(page).to have_content "Delete post"

        click_link "Delete post"

        expect(page).to have_content "Your post has been deleted."
    end

    scenario "only the OP can edit posts" do
        expect(page).to have_content "Edit post"

        click_link "Edit post"
        fill_in "Title", with: "Edited Post"
        click_button "Update"

        expect(page).to have_content "Post edited."
        expect(page).to have_content "Edited Post"
    end

    scenario "other users can't see either links" do
        visit "/"

        click_link "Sign out"
        login_as(user2)

        click_link "Cool Project"

        expect(page).not_to have_content "Edit post"
        expect(page).not_to have_content "Delete post"
    end
end



