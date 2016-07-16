feature 'Picture Comments' do
  before do
    sign_up
    upload_photo
    click_link(:Show)
    fill_in(:'comment[text]', with: 'Hello, this is comment')
    click_button(:'Add Comment')
    click_link(:Show)
  end

  scenario 'User can add a comment to a photo' do
    expect(page).to have_content('Hello, this is comment')
  end

  scenario 'User can edit a comment' do
    within('.picture-comments') do
      click_link(:Edit)
    end
    fill_in(:'comment[text]', with: 'Hello, this is edited comment')
    expect(page).to have_content('Hello, this is edited comment')
    expect(page).to_not have_content('Hello, this is comment')
  end

  scenario 'User cannot edit another user\'s comment' do
    user = {
      email: 'another@example.com',
      display_name: 'another',
      password: 'supersecure'
    }
    click_link(:'Log Out')
    sign_up(user)
    click_link(:Show)
    within('.picture-comments') do
      click_link(:Edit)
    end
    expect(page).to have_content('You are not the author!')

  end
end
