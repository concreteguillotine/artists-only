require "rails_helper"

RSpec.feature "Users can vote on posts" do
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

    scenario "by clicking a button" do
        visit "/"
        click_button "Sign out"
        login_as(user2)
        click_link "Cool Project"

        expect(page).to have_content "This post has 0 votes!"

        click_button "Like"

        expect(page).to have_content "This post has 1 vote!"
    end
end

