require "rails_helper"

RSpec.feature "Users can comment on posts" do
    let(:user) { FactoryBot.create(:user) }

    before do
        login_as(user)
    end

    scenario "with text" do
        visit "/"
        click_button "New post"

        fill_in "Title", with: "Cool Project"
        attach_file("Image", "spec/fixtures/testimage.jpg")
        fill_in "Text", with: "This is my new project, add what you like!"
        page.check("Open?")
        click_button "Create Post"

        within(".comments") do
            fill_in "Text", with: "This is my cool comment!"
            click_button "Create Comment"
        end

        expect(page).to have_content "Comment has been created!"

        within(".comments") do
            expect(page).to have_content "This is my cool comment!"
        end
    end
end