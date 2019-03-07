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


   def edit
      @post = Post.find(params[:id])
      @category = Category.all
   end


   def update
      @post = Post.find(params[:id])

      if @post.update_attributes(:title => params[:post]["title"], :body => params[:post]["body"], :category_id => params[:post]["category_id"])
         redirect_to posts_path, :notice => "Yor post has been updated"
      else
         render "edit"
      end
   end


   def destroy
      @post = Post.find(params[:id])
      @post_name = @post.title

      @post.destroy

      redirect_to posts_path, :notice => "the #{@post_name} has been deleted"
   end

end
