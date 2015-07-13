feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'cannot sign up with existing email address' do
    visit '/users/new'
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email address already in use")
  end

  def sign_up(email: 'alice@example.com',
              password: 'oranges!')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email,    with: email
    fill_in :password, with: password
    click_button 'Sign up'
  end

end