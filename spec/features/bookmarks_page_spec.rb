require_relative './web_helpers'

feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    populate_test_db
    visit '/bookmarks'
    expect(page).to have_link('Destroy', href: 'http://www.destroyallsoftware.com')
  end
end

feature 'delete a book from the list' do
  scenario 'delete by clicking button' do
    populate_test_db
    visit '/bookmarks'
    click_button 'Delete Destroy'
    expect(page).to_not have_content 'Destroy'
  end

  feature 'update bookmark' do
    scenario 'user updates existing bookmark giving it new url' do
      populate_test_db
      visit '/bookmarks'
      fill_in('http://www.destroyallsoftware.com', with: 'http://wwww.saveallsoftware.com')
      click_button('update Destroy')
      expect(page).to_not have_link('Destroy', href: 'http://www.destroyallsoftware.com')
      expect(page).to have_link('Destroy', href: 'http://wwww.saveallsoftware.com')
    end
  end
end
