require "rails_helper"

RSpec.feature "Users can sign up" do
    let!(:user) { FactoryBot.create(:user) }

    before do
        visit "/"
    end

    scenario "when providing valid details" do
        click_button "Sign up"
        fill_in "Email", with: "text@example.com"
        fill_in "Username", with: "Username"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        within(".actions") do
            click_button "Sign up"
        end
        expect(page).to have_content("You have signed up successfully.")
    end

    scenario "after signing up, users can sign in" do
        click_button "Sign in"
        fill_in "Username", with: user.username
        fill_in "Password", with: "password"
        within(".actions") do
            click_button "Sign in"
        end
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Signed in as #{user.username}")
    end

    scenario "once signed in, users can sign out" do
        login_as(user)
        visit "/"
        click_button "Sign out"
        expect(page).to have_content("Signed out successfully.")
    end

    scenario "users can delete their posts from their profile" do
        login_as(user)
        visit "/"
        click_button "Your profile"
        click_link "Delete profile"
        expect(page).to have_content("Your profile has been deleted! Good bye.")
    end
end