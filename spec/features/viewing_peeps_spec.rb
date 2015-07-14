require 'spec_helper'

feature 'Viewing peeps' do

  before(:each) do
  new_user = User.create
  Peep.create(message: 'This app is awesome!!!',
                tags: [Tag.first_or_create(name: 'funny')], user_id: new_user.id)

  Peep.create(message: 'I love lab week',
                tags: [Tag.first_or_create(name: 'lab')], user_id: new_user.id)
  end


  scenario 'I can see existing peeps on the main peeps page' do
    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'div#peeps' do
      expect(page).to have_content('This app is awesome!!!')
    end
  end


  scenario 'I can filter peeps by tag' do

  visit '/tags/lab'
  within 'div#peeps' do
    expect(page).not_to have_content('This app is awesome')
    expect(page).to have_content('I love lab week')
  end
end

end