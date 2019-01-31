require_relative 'database_connection'

class Bookmark
  def self.all
    pg_object = DatabaseConnection.query("SELECT * FROM bookmarks")
    bookmarks = []
    pg_object.each { |bookmark| bookmarks << bookmark }
    bookmarks
  end

  def self.add_bookmark(url, title)
    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end

  def self.delete(row_id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{row_id}'")
  end

  def self.update(id, url)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}' WHERE id = '#{id}'")
  end
end
