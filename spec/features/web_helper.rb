USER = {
  email: 'van@example.com',
  display_name: 'vannio',
  password: 'supersecure'
}

def sign_up(params=USER)
  visit('/')
  click_link('Sign Up')
  fill_in('user[email]', with: params[:email])
  fill_in('user[display_name]', with: params[:display_name])
  fill_in('user[password]', with: params[:password])
  fill_in('user[password_confirmation]', with: params[:password])
  click_button('Sign up')
end
