require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"

require './image_uploader.rb'
require './models.rb'

get '/' do
  @gamedata = Gamedata.all
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

post '/update' do

  # 大体こんな感じだけどデータによっては後でロジックを変更
  if params[:black]
    @content = Gamedata.find(params[:id])

    @content.update({
      data: params[:data]
    })
  end

  if params[:white]
    @content = Gamedata.find(params[:id])

    @content.update({
      data: params[:data]
    })
  end

  redirect '/'
end