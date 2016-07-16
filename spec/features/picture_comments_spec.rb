feature 'Picture Comments' do
  scenario 'User can add a comment to a photo' do
    sign_up
    upload_photo
    click_link(:Show)
    fill_in(:comment, with: 'Hello, this is comment')
    click_button(:'Add comment')
    click_link(:Show)
    expect(page).to have_content('Hello, this is comment')
  end
end
