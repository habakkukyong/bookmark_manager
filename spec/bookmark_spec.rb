require 'bookmark'
require_relative './features/web_helpers'

describe Bookmark do
  it 'returns a list of bookmarks' do
    populate_test_db
    bookmarks = Bookmark.all
    expect(bookmarks).to include(['http://www.destroyallsoftware.com', 'Destroy'])
  end

  describe "#add_bookmark" do
    it 'adds bookmark to database' do
      Bookmark.add_bookmark("http://www.distrowatch.org", "distro")
      expect(Bookmark.all).to include(["http://www.distrowatch.org", "distro"])
    end
  end
end
