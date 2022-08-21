require "rails_helper"

RSpec.feature "Users can sign up" do
    let!(:user) { FactoryBot.create(:user) }

    before do
        visit "/"
    end

    scenario "when providing valid details" do
        click_link "Sign up"
        fill_in "Email", with: "text@example.com"
        fill_in "Username", with: "Username"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
        click_button "Sign up"
        expect(page).to have_content("You have signed up successfully.")
    end

    scenario "after signing up, users can sign in" do
        click_link "Sign in"
        fill_in "Username", with: user.username
        fill_in "Password", with: "password"
        click_button "Sign in"
        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Signed in as #{user.username}")
    end

    scenario "once signed in, users can sign out" do
        login_as(user)
        visit "/"
        click_link "Sign out"
        expect(page).to have_content("Signed out successfully.")
    end
end