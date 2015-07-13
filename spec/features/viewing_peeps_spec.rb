require 'spec_helper'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the main peeps page' do
    Peep.create(message: 'This app is awesome!!!')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('This app is awesome!!!')
    end
  end

end