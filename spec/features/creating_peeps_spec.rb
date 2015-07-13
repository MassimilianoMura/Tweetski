require 'spec_helper'

feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'Hey lab team'
    click_button 'Post peep'
    expect(page).to have_content('Hey lab team')
  end

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

end