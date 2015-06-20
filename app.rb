require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require "sinatra/json"

require './image_uploader.rb'
require './models.rb'

get '/' do
  @contents = Contribution.order('id desc').all
  erb :index
end

post '/new' do
  logger.info "名前：#{params[:user_name]}、内容：#{params[:body]}"
  Contribution.create({
    name: params[:user_name], 
    body: params[:body],
    img: ""
  })
  
  if params[:file]
    image_upload(params[:file])
  end
  
  redirect '/'
end