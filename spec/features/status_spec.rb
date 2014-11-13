require 'rails_helper'

feature "status" do
  scenario "create a status" do
    visit root_path
    click_on "Status Place"
    click_on "New Status"
    click_on "Create Status"
    expect(page).to have_content("Status can't be blank")
    fill_in "User", with: "Name"
    fill_in "Status", with: "test status"
    fill_in "Likes", with: 5
    click_on "Create Status"
    expect(page).to have_content("Successfully statused")
    click_on "Edit"
    fill_in "Status", with: "test status 2"
    click_on "Update Status"
    expect(page).to have_content("Successfully updated")
    click_on "destroy"
    expect(page).to have_content("Totes deleted, yo")
  end

end
