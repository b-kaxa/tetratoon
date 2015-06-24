require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"

require './image_uploader.rb'
require './models.rb'

get '/' do
  erb :index
end

post '/new' do
  Gamedata.create({
    data: params[:data]
  })
  
  if params[:file]
    image_upload(params[:file])
  end
  
  redirect '/'
end