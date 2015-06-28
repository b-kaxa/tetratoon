require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"

require './image_uploader.rb'
require './models.rb'

get '/' do
  @gamedata1 = Gamedata.limit(10).offset(0)
  @gamedata2 = Gamedata.limit(10).offset(10)
  @gamedata3 = Gamedata.limit(10).offset(20)
  @gamedata4 = Gamedata.limit(10).offset(30)
  @gamedata5 = Gamedata.limit(10).offset(40)
  @gamedata6 = Gamedata.limit(10).offset(50)
  @gamedata7 = Gamedata.limit(10).offset(60)
  @gamedata8 = Gamedata.limit(10).offset(70)
  @gamedata9 = Gamedata.limit(10).offset(80)
  @gamedata10 = Gamedata.limit(10).offset(90)
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