require_relative './database_connection_setup'
require 'sinatra/base'
require_relative './lib/bookmark'
require 'sinatra/flash'


# Handles http requests responding to some by passing params to Bookmark class
class BookmarkApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/add' do
    if params[:Add_url].match?(/\Ahttp/)
      Bookmark.add_bookmark(params[:Add_url], params[:Add_title])
      redirect '/'
    else
      flash[:notice] = "URL invalid"
    end
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
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
