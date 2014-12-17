require 'sinatra'
require 'sinatra/activerecord'
require_relative "./models/user"
require_relative "./models/product"
require_relative './config/environments'

enable :sessions

helpers do
  def current_user
    @current_user || nil
  end

  def current_user?
    @current_user == nil ? false : true
  end
end

before do
  session[:cart] ||= []
  @errors ||= []
  @current_user = User.find_by(:id => session[:user_id])
end

get "/" do
  erb :index
end

get "/users" do
  if current_user?
    erb :profile
  else
    redirect('/session/login')
  end
end

get "/products" do
  @products = Product.where("quantity >'0'")
  erb :products
end

get "/products/add" do 
  erb :add
end

get "/products/my_swaps" do
  @current_user_id = @current_user.id
  @my_swaps = Product.where(:user_id => @current_user_id )
  erb :my_swaps
end

post "/products/my_swaps/delete" do
  Product.delete(params[:my_swap_id_delete])
  session[:cart].delete(params[:my_swap_id_delete])
  redirect('/products/my_swaps')
end

get '/products/my_swap/edit/:item' do
  @item_num = params[:item]
  @item_info = Product.where(:id => @item_num)
  erb :my_swaps_edit
end

post '/products/my_swap/edit' do
  Product.update(
    params[:my_swap_id_edit],
    product_name: params[:product_name],
    description: params[:description],
    image: params[:product_image],
    price: params[:price],
    seller: @current_user.user_name,
    quantity: params[:product_quantity],
    user_id: @current_user.id
  )
end


post "/user/add" do
@new_swap = Product.create(
  product_name: params[:product_name],
  description: params[:description],
  image: params[:product_image],
  price: params[:price],
  seller: @current_user.user_name,
  quantity: params[:product_quantity],
  user_id: @current_user.id
  )
end


get "/cart" do
  @cart_items = Product.where(:id => session[:cart]) 
  erb :cart
end

post "/cart/product_add" do
  Product.update(
    params[:product_id_add],
    quantity: params[:product_quantity]
  )

  session[:cart] << params[:product_id_add]
  redirect('/cart')
end

post "/cart/product_delete" do
  session[:cart].delete(params[:product_id_delete])
  redirect('/cart')
end

get '/session/login' do
  erb :login
end

post "/session/login" do
  user = User.find_by(:email => params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect('/users')
  else
    @errors << "Invalid email or password. Try again!"
    erb :login
  end
end

get '/session/sign_up' do
  erb :sign_up
end

post "/session/sign_up" do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect('/users')
  else
    @user = user
    erb :sign_up
  end
end

get "/session/logout" do
  session.clear
  redirect('/')
end