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
  
  redirect '/'
end

post '/update' do

  # if params[:black] then
    # if params[:data]
    #   data = params[:data]
    # end

    # Gamedata.where(id: params[:update_blocks]).update_all(data: data)
  # end

  # if params[:white] then
    if params[:data]
      data = params[:data]
    end

    Gamedata.where(id: params[:update_blocks]).update_all(data: data)
  # end

  redirect '/'
end