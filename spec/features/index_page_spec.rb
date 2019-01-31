feature 'index view' do
  scenario 'when homepage is loaded' do
    visit '/'
    expect(page).to have_content('Welcome to Bookmark Manager')
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
    fill_in('Add_title', with: 'distro')
    click_button('Add bookmark')
    visit '/bookmarks'
    expect(page).to have_content('distro')
    expect(page).to_not have_content('http://www.distrowatch.org')
  end

  scenario 'user adds invalid url' do
    visit '/'
    fill_in('Add_url', with: 'www.distrowatch.org')
    click_button('Add bookmark')
    expect(page).to have_content('URL invalid')
    expect(page).to_not have_content('www.distrowatch.org')
  end
end
