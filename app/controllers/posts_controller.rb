class PostsController < ApplicationController


   def index
      @content1 = "message from controller"

      @content2 = "another message from controller"

      @posts = Post.all
   end


   def show
      @post = Post.find(params[:id])
   end

   def new
      @post = Post.new
      @category = Category.all
   end

   def create
      puts "data:: ",params[:post]["title"]
      @post = Post.new(:title => params[:post]["title"], :body => params[:post]["body"], :category_id => params[:post]["category_id"])

      if @post.save
         redirect_to posts_path, :notice => "Your post has been saved"

      else
         render "new"
      end
   end

end
