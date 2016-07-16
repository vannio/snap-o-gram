feature 'Upload Pictures' do
  scenario 'User can upload picture' do
    sign_up
    upload_photo
    expect(page).to have_content('Picture was successfully created.')
  end
end
