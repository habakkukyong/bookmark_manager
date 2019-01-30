require 'pg'

class Bookmark
  def self.all
    connect_db
    bookmarks = @connection.exec ("SELECT * FROM bookmarks")
    bookmarks.map { |bookmark| bookmark['url'] }
  end

  def self.add_bookmark(new_bookmark)
    connect_db
    @connection.exec ("INSERT INTO bookmarks (url) VALUES('#{new_bookmark}')")
  end

  private

  def self.connect_db
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      @connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
