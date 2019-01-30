feature 'index view' do
  scenario 'when homepage is loaded' do
    visit '/'
    expect(page).to have_content('Welcome to Habalex BookMark Manager')
    expect(page).to have_content('Click below to access your bookmarks')
  end

  scenario 'has view bookmarks link' do
    visit '/'
    click_button('View Bookmarks')
    expect(page).to have_content('Bookmark List')
  end

  scenario 'user adds a bookmark' do
    visit '/'
    fill_in('Add_url', with: 'http://www.distrowatch.org')
    click_button('Add bookmark')
    visit '/bookmarks'
    expect(page).to have_content('http://www.distrowatch.org')
  end
end
