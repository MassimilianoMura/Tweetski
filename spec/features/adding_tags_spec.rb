require 'spec_helper'

feature 'Adding tags' do

  scenario 'I can add a single tag to a new peep' do
    visit '/peeps'
    fill_in 'message', with: 'Hey lab team'
    fill_in 'tag', with: 'lab'
    click_button 'Post peep'
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('lab')
  end

end