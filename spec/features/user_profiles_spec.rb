require "rails_helper"

RSpec.feature "Users have profiles" do
    let!(:user1) { FactoryBot.create(:user, username: "user1") }
    let!(:user2) { FactoryBot.create(:user, username: "user2") }
    before do
        login_as(user1)
        visit "/"
        click_button "New post"

        fill_in "Title", with: "Cool Project"
        click_button "Create Post"

        visit "/"
        click_button "Sign out"

        login_as(user2)
        visit "/"
        click_button "New post"

        fill_in "Title", with: "Different Project"
        click_button "Create Post"

        click_button "Your profile"
    end

    scenario "they can edit their profile, adding an avatar and about me (for now)" do
        click_link "Edit profile"
        attach_file("Avatar", "spec/fixtures/testimage.jpg")
        fill_in "About me", with: "My name is user2, and I'm so cool"
        click_button "Update profile"

        expect(page).to have_content "Profile updated."
        expect(page).to have_content "My name is user2"
    end


    scenario "where they can see their own posts" do
        expect(page).to have_content "This is your profile"

        within(".posts") do
            expect(page).to have_content "Different Project"
        end
    end

    scenario "but they can't see other users' posts" do
        within(".posts") do
            expect(page).not_to have_content "Cool Project"
        end
    end
end



