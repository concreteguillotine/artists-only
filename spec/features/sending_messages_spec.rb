require "rails_helper"

RSpec.feature "Users can send messages" do
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

    scenario "to the OP of a post to collaborate, the OP then can approve it" do
        visit "/"
        click_button "Sign out"
        login_as(user2)
        click_link "Cool Project"

        expect(page).to have_content "This post is open for editing, request to collaborate here!"  

        click_link "here!"
        fill_in "Text", with: "A poem of the beauty of Margot"
        fill_in "Description", with: "I think this image and poem will go along well!"
        attach_file("Image", "spec/fixtures/testimage.jpg")
        click_button "Send message"

        expect(page).to have_content "Message sent, awaiting approval from the original poster!"

        click_button "Sign out"
        login_as(user1)
        visit "/"
        click_link "Your profile"

        within(".messages") do
            expect(page).to have_content "Cool Project"
            expect(page).to have_content "A poem of the beauty of Margot"
            expect(page).to have_content "I think this image and poem will go along well!"
            click_link "Add to post"
        end

        expect(page).to have_content "Additions added!"

        expect(page).to have_content "A poem of the beauty of Margot"
    end
end