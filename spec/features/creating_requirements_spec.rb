require 'rails_helper'

feature 'Creating Requiremens' do

  before do
    FactoryGirl.create(:project, name: "QLF RCO")

    visit '/'
    click_link 'QLF RCO'
    click_link 'New Requirement'

  end

  scenario "Creating a requirement" do
    fill_in "Office", with: "ANI"
    fill_in "Title", with: "My first requirement"
    fill_in "Requirements", with: "These are the requirements."
    click_button "Create Requirement"

    expect(page).to have_content("Requirement has been created.")
  end

  scenario "Creating a requirement without valid attributes fails" do
    click_button "Create Requirement"

    expect(page).to have_content("Requirement has not been created.")
    expect(page).to have_content("can't be blank")
    expect(page).to have_content("can't be blank")
    expect(page).to have_content("can't be blank")

  end

end
