require './lib/database_connection'
require 'pg'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end
