require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"

require './image_uploader.rb'
require './models.rb'

get '/' do
  # 力技
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

post '/update' do

  if params[:data]
    data = params[:data]
  end

  Gamedata.where(id: params[:update_blocks]).update_all(data: data)

  redirect '/'
end

get '/reset' do

  white_id = [1..10]
  black_id = [91..100]
  gray_id = [11..90]

  Gamedata.where(id: white_id).update_all(data: 1)
  Gamedata.where(id: black_id).update_all(data: 2)
  Gamedata.where(id: gray_id).update_all(data: 0)

  redirect '/'
end