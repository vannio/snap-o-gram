feature 'User sign in and out' do
  context 'not signed in' do
    scenario 'should see a "sign up" and "log in" link' do
      visit('/')
      expect(page).to have_content('Sign up')
      expect(page).to have_content('Log in')
    end
  end

  context 'signed in' do
    scenario 'should see a "log out" link and a link to edit profile' do
      sign_up
      expect(page).to have_content('Update profile')
      expect(page).to have_content('Log out')
    end
  end
end
