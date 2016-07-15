feature 'User sign in and out' do
  context 'not signed in' do
    scenario 'should see a "sign up" and "log in" link' do
      visit('/')
      expect(page).to have_content('Sign Up')
      expect(page).to have_content('Log In')
    end
  end

  context 'signed in' do
    scenario 'should see a "log out" link' do
      visit('/')
      click_link('Sign Up')
      fill_in('user[email]', with: 'v@v.v')
      fill_in('user[password]', with: 'vvvvvv')
      fill_in('user[password_confirmation]', with: 'vvvvvv')
      click_button('Sign up')
      expect(page).to have_content('Log Out')
    end
  end
end
