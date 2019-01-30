require 'bookmark'
require_relative './features/web_helpers'

describe Bookmark do
  describe '#display_bookmarks' do
    it 'returns a list of bookmarks' do
      populate_test_db
      bookmarks = Bookmark.all
      expect(bookmarks).to include(['http://www.destroyallsoftware.com', 'Destroy'])
    end
  end

  describe '#add_bookmark' do
    it 'adds bookmark to database' do
      Bookmark.add_bookmark("http://www.distrowatch.org", "distro")
      expect(Bookmark.all).to include(["http://www.distrowatch.org", "distro"])
    end
  end

  describe '#delete_bookmark' do
    it 'deletes a bookmark from the database' do
      Bookmark.delete("Makers")
      expect(Bookmark.all).to_not include(["http://www.makersacademy.com", "Makers"])
    end
  end
end
