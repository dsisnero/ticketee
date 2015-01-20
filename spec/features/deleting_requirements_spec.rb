require 'rails_helper'

feature 'Deleting requirements' do
  let!(:project){ FactoryGirl.create(:project)}
  let!(:requirement){ FactoryGirl.create(:requirement, project: project)}

  before do
    visit "/"
    click_link project.name
    click_link requirement.title
  end


  scenario "Deleting a requirement" do
    click_link "Delete Requirement"

    expect(page).to have_content("Requirement has been deleted.")
    expect(page.current_url).to eq(project_url(project))
  end

end
