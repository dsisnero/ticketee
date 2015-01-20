require 'rails_helper'

feature "Viewing requirements" do
  before do
    qlf = FactoryGirl.create(:project, name: "QLF RCO")

    FactoryGirl.create(:requirement,
                       project: qlf,
                       office: 'ANI',
                       title: 'My requirement',
                       requirements: 'This is a great requirement'
                       )

    muo = FactoryGirl.create(:project, name: "MOU RCO")

    FactoryGirl.create(:requirement,
                       project: muo,
                       office: 'AJW',
                       title: "Standards compliance",
                       requirements: 'Grounding'
                       )

    visit '/'

  end

  scenario 'Viewing requirements for a given project' do

    click_link 'QLF RCO'

    expect(page).to have_content('My requirement')
    expect(page).to_not have_content('Standards compliance')

    click_link('My requirement')
    within("#requirement h2") do
      expect(page).to have_content("My requirement")
    end

    expect(page).to have_content("This is a great requirement")

  end
end
