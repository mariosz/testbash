class PostsController < ApplicationController
  before_filter :authenticate_user!

  #GET index.haml
  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.where(id: params[:id]).last
  end

  #POST /posts
  def new
    @post = Post.new
  end

  #PUT /posts/:id
  def create
    @post = Post.create(params[:post])
    redirect_to post_path(@post)
  end

  #GET /posts/:id
  def edit
    @post = Post.where(id: params[:id]).last
  end


  #PUT /posts/:id
  def update
    @post = Post.where(id: params[:id]).last
    @post.update_attributes(params[:post])
    redirect_to post_path(@post)
  end

  #DELETE /posts/:id
  def destroy
    Post.where(id: params[:id]).last.destroy
    redirect_to root_path
  end

end
