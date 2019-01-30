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
end
