feature 'Picture Comments' do
  before do
    sign_up
    upload_photo
    click_link(:Show)
    fill_in(:'comment[text]', with: 'Hello, this is comment')
    click_button(:'Add Comment')
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
    click_link(:'Comments (1)')
    within('.picture-comments') do
      expect(page).to_not have_content('Edit')
    end
  end

  scenario 'User can see how many comments a photo has' do
    fill_in(:'comment[text]', with: 'Hello, this is comment 2')
    click_button(:'Add Comment')
    fill_in(:'comment[text]', with: 'Hello, this is comment 3')
    click_button(:'Add Comment')
    click_link(:'Back')
    expect(page).to have_content('Comments (3)')
  end
end
