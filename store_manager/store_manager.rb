require 'sinatra'

class Product
  attr_reader :id, :name, :price, :brand

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @price = hash[:price]
    @brand = hash[:brand]
  end

  def change_name(name)
    @name = name
  end

  def change_price(price)
    @price = price
  end

  def change_brand(brand)
    @brand = brand
  end

end

products = [
  Product.new({ id: 0, name: "samsung galaxy s6 edge", price: 829.90, brand: "samsung" }),
  Product.new({ id: 1, name: "lg g flex", price: 689.90, brand: "lg" }),
  Product.new({ id: 2, name: "apple iphone 6 plus", price: 779.90, brand: "apple" }),
  Product.new({ id: 3, name: "samsung galaxy alpha", price: 589.90, brand: "samsung" }),
  Product.new({ id: 4, name: "nokia lumia 930", price: 489.90, brand: "nokia" }),
  Product.new({ id: 5, name: "sony xperia z3 compact", price: 389.90, brand: "sony" }),
  Product.new({ id: 6, name: "apple iphone 6", price: 779.90, brand: "apple" }),
  Product.new({ id: 7, name: "huawei ascend g7", price: 259.90, brand: "huawei" }),
  Product.new({ id: 8, name: "sony xperia t2 ultra", price: 359.90, brand: "sony" }),
  Product.new({ id: 9, name: "lg g4", price: 589.90, brand: "lg" }),
  Product.new({ id: 10, name: "samsung galaxy note 4", price: 689.90, brand: "samsung" }),
  Product.new({ id: 11, name: "htc one m9", price: 674.90, brand: "htc" }),
  Product.new({ id: 12, name: "apple iphone 5s", price: 589.90, brand: "apple" })
]

get '/' do
  @products = products
  erb :index
end

get '/form' do
  erb :form
end

post '/new' do
  products << Product.new(id: products.last.id + 1, name: params[:name], price: params[:price], brand: params[:brand])
  redirect "/"
end

get '/remove/:id' do
  products.reject! do |product|
    product.id == params[:id].to_i
end
  redirect "/"
end

get '/show/:id' do
  @products = products.find do |product|
    product.id == params[:id].to_i
  end
  erb :show
end

get '/edit/:id' do
  @products = products.find do |product|
    product.id == params[:id].to_i
end
  erb :edit_form
end

get '/update/:id' do

    product = products.find do |product|
    product.id == params[:id].to_i
  end
    product.change_name(params[:name])
    product.change_brand(params[:brand])
    product.change_price(params[:price])
  
  redirect "/show/#{params[:id]}"
end

