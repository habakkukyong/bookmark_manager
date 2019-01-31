require_relative 'database_connection'

class Bookmark
  def self.all
    pg_object = DatabaseConnection.query("SELECT * FROM bookmarks")
    bookmarks = []
    pg_object.each { |bookmark| bookmarks << bookmark }
    bookmarks
  end

  def self.add_bookmark(url, title)
    if is_valid_url?(url)
      DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
    else
      false
    end
  end

  def self.delete(row_id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = '#{row_id}'")
  end

  def self.update(id, url)
    if is_valid_url?(url)
      DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}' WHERE id = '#{id}'")
    else
      false
    end
  end

  private

  def self.is_valid_url?(url)
    url.match?(/\Ahttp/)
  end
end
