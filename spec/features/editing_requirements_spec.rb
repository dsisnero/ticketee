require 'rails_helper'

feature 'Editing requirements' do
  let!(:project){ FactoryGirl.create(:project)}
  let!(:requirement) { FactoryGirl.create(:requirement, project: project)}

  before do
    visit '/'
    click_link project.name
    click_link requirement.title
    click_link "Edit Requirement"
  end

  scenario "Updating a requirement" do
    fill_in "Title", with: "Latest changes"
    click_button "Update Requirement"

    expect(page).to have_content('Requirement has been updated')

    within("#requirement h2") do
      expect(page).to have_content("Latest changes")
    end

    expect(page).to_not have_content requirement.title
  end

  scenario "Updating a requirement with invalid information" do
    fill_in "Title", with: ""
    click_button "Update Requirement"

    expect(page).to have_content("Requirement has not been updated.")
  end

end
