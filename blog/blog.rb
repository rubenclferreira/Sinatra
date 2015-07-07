require 'sinatra'



class Post

	attr_reader :id, :title, :body, :author, :created_at

  def initialize(id, title, body, author, created_at)
    @id = id
    @title = title
    @body = body
    @author = author
    @created_at = created_at
  end

  def to_s
  	title
  end
 
end

class Comment

	attr_reader :id, :body, :author, :post_id

  def initialize(id, body, author, post_id)
    @id = id
    @ody = body
    @author = author
    post_id = post_id
  end
 
end

class Comment

  attr_reader :id, :body, :author, :post_id

  def initialize(id, body, author, post_id)
    @id = id
    @body = body
    @author = author
    @post_id = post_id
  end
  
end

comments = [
  Comment.new(1, 'I really like this post', 'Gabriel', 1),
  Comment.new(2, 'Niiiiiice', 'Ruben', 2)
]

posts = [
  Post.new(1, "Primeiro post", "Hello World", "Ruben", "6 de julho de 2015"),
  Post.new(2, "segundo post", "Hello World", "Ruben", "6 de julho de 2015")
]

get '/show/:id' do
  @post = posts.find do |post|
  	post.id == params[:id].to_i
  end
  @comments = comments.select do |comment|
    comment.post_id == params[:id].to_i
  end
  erb :show
end



get '/' do
  @posts = posts
  erb :index
end
