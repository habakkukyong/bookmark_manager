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

    it 'does not add invalid url to database' do
      Bookmark.add_bookmark("www.distrowatch.org", "distro")
      expect(Bookmark.all).not_to include({"id" => "1", "title" => "distro", "url" => "www.distrowatch.org"})
    end

    it 'returns false if invalid url entered' do
      expect(Bookmark.add_bookmark("www.distrowatch.org", "distro")).to eq false
    end
  end

  describe '#delete_bookmark' do
    it 'deletes a bookmark from the database' do
      setup_test_database
      populate_test_db
      Bookmark.delete(2)
      expect(Bookmark.all).to_not include({"id" => "2", "title" => "Destroy", "url" => "http://www.destroyallsoftware.com"})
    end
  end

  describe '#update_bookmark' do
    it 'updates a bookmark' do
      populate_test_db
      Bookmark.update(2, "http://www.saveallsoftware.com")
      expect(Bookmark.all).to include({"id" => "2", "title" => "Destroy", "url" => "http://www.saveallsoftware.com"})
    end

    it "doesn't update bookmark if given invalid url" do
      populate_test_db
      Bookmark.update(2, "www.saveallsoftware.com")
      expect(Bookmark.all).to_not include({"id" => "2", "title" => "Destroy", "url" => "www.saveallsoftware.com"})
      expect(Bookmark.all).to include({"id" => "2", "title" => "Destroy", "url" => "http://www.destroyallsoftware.com"})
    end
  end

end
