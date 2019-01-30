require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    Bookmark.add_bookmark(params[:Add_url])
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

end
