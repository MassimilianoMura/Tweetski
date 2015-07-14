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
    expect(page).to have_content("Email address or username already in use")
  end

end


feature 'User sign in' do

 let(:user) do
   User.create(email: 'alice@example.com',
               password: 'oranges!')
 end

 scenario 'with correct credentials' do
   sign_up
   sign_in(email: user.email,   password: user.password)
   expect(page).to have_content "Welcome, #{user.email}"
 end

end

feature 'User sign out' do
  
  let(:user) do
   User.create(email: 'user@example.com',
               password: 'secret1234')
  end

  scenario 'while being signed in' do
    sign_up
    sign_in(email: user.email,   password: user.password)
    click_button('Sign out')
    expect(page).to have_content "You have been signed out"
  end
end