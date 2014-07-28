require 'rails_helper'
require 'capybara/rails'

feature 'People' do
  scenario 'Users can view people and edit people' do
    create_user
    visit '/'
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"

    click_link "New Person"
    fill_in "Title", with: "Dr."
    fill_in "First name", with: "Sara"
    fill_in "Last name", with: "Jones"
    click_on "Create Person"

    click_link "Dr. Sara Jones"
    expect(page).to have_content "Dr. Sara Jones"
    click_link "Edit"

    expect(page).to have_content "Title"
    expect(page).to have_content "First name"
    expect(page).to have_content "Last name"
  end
end