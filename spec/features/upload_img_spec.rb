feature 'Upload Pictures' do
  scenario 'User can upload picture' do
    visit '/pictures/new'
    attach_file('Image', '/assets/test_1.jpg')
    click_button :'Create picture'
    expect(page).to have_content('img')
  end
end
