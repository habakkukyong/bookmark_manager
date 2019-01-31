require 'database_connection'

describe DatabaseConnection do
  describe '#setup' do
    it 'connects to the database passed in as its argument' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '#query' do
    it 'takes an sql query and executes it on the connection' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM bookmarks;')
      DatabaseConnection.query('SELECT * FROM bookmarks;')
    end
  end
end
