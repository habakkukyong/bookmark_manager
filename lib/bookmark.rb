require 'pg'

class Bookmark
  def self.all
    connect_db
    bookmarks = @connection.exec ("SELECT * FROM bookmarks")
    bookmarks.map { |bookmark| [bookmark['url'], bookmark['title']] }
  end

  def self.add_bookmark(url, title)
    connect_db
    @connection.exec ("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(row_title)
    connect_db
    @connection.exec ("DELETE FROM bookmarks WHERE title = '#{row_title}'")
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
