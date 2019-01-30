require 'bookmark'
require_relative './features/web_helpers'

describe Bookmark do
  describe '#display_bookmarks' do
    it 'returns a list of bookmarks' do
      populate_test_db
      bookmarks = Bookmark.all
      expect(bookmarks).to include({"id" => "2", "title" => "Destroy", "url" => "http://www.destroyallsoftware.com"})
    end
  end

  describe '#add_bookmark' do
    it 'adds bookmark to database' do
      Bookmark.add_bookmark("http://www.distrowatch.org", "distro")
      expect(Bookmark.all).to include({"id" => "1", "title" => "distro", "url" => "http://www.distrowatch.org"})
    end
  end

  describe '#delete_bookmark' do
    it 'deletes a bookmark from the database' do
      Bookmark.delete("Makers")
      expect(Bookmark.all).to_not include({id: 1, url: 'http://www.makersacademy.com', title: 'Makers'})
    end
  end
end
