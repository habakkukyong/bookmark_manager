require './lib/database_connection'
require 'pg'

def connect_db
  if ENV['RACK_ENV'] == 'test'
    DatabaseConnection.setup('bookmark_manager_test')
  else
    DatabaseConnection.setup('bookmark_manager')
  end
end
