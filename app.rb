require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/add' do
    Bookmark.add_bookmark(params[:Add_url], params[:Add_title])
    redirect '/'
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
