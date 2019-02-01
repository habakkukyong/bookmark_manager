require_relative './database_connection_setup'
require 'sinatra/base'
require_relative './lib/bookmark'
require 'sinatra/flash'


# Handles http requests responding to some by passing params to Bookmark class
class BookmarkApp < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    flash[:notice] = "Invalid URL" unless Bookmark.add_bookmark(params[:Add_url], params[:Add_title])
    redirect '/bookmarks'
  end

  post '/delete' do
    Bookmark.delete(params[:deletion])
    redirect '/bookmarks'
  end

  post '/update' do
    Bookmark.update(params[:updated_bookmark_id], params[:new_url])
    redirect '/bookmarks'
  end
end
