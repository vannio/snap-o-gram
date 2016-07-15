feature 'Upload Pictures' do
  scenario 'User can upload picture' do
    visit '/pictures/new'
    attach_file('picture[file_path]', './spec/assets/test_1.jpg')
    click_button :'Create Picture'
    expect(page).to have_content('Picture was successfully created.')
  end
end
