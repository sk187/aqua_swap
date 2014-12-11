require 'sinatra'
require 'sinatra/activerecord'
require_relative './models/item'
require_relative './config/environments'

#setting up the index route
get '/' do
  @items = Item.all
  erb :index
end

#setting up the form view
get '/new' do 
  erb :new_form
end

#setting up the post route for our form
post '/new' do
  @item = Item.new(title: params[:title], desc: params[:desc])
  if @item.save
    redirect '/'
  else
    @errors = @item.errors.full_messages
    render '/new'
  end
end