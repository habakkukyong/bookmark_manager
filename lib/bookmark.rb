require 'pg'

class Bookmark
  def self.all
    connect_db
    pg_object = @connection.exec ("SELECT * FROM bookmarks")
    bookmarks = []
    pg_object.each { |bookmark| bookmarks << bookmark }
    bookmarks
  end

  def self.add_bookmark(url, title)
    connect_db
    @connection.exec ("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(row_id)
    connect_db
    @connection.exec ("DELETE FROM bookmarks WHERE id = '#{row_id}'")
  end

  def self.update(id, url)
    connect_db
    @connection.exec ("UPDATE bookmarks SET url = '#{url}' WHERE id = '#{id}'")
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
