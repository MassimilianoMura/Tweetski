require 'spec_helper'

feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps'
    fill_in 'message', with: 'Hey lab team'
    click_button 'Post peep'
    expect(page).to have_content('Hey lab team')
  end

  scenario 'New peep has a time' do
    time = Time.new(2015, 7, 5, 15, 25, 0, "+01:00")
    visit '/peeps'
    fill_in 'message', with: 'Hey lab team'
    click_button 'Post peep'
    expect(page).to have_content('15:25 5/7/2015')
  end

  scenario 'there are no peeps in the database at the start of the test' do
    expect(Peep.count).to eq 0
  end

end