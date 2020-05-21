class PostsController < ApplicationController 

  def show
    @post = set_post
  end

  def new
    @post = Post.new 
  end

  def create 
    @post = Post.new(post_params)
    if @post.save 
      redirect_to post_path(@post)
    else  
      render :new
    end
  end

  def edit 
    @post = set_post
  end

  def update
    @post = set_post
    if @post.update(post_params)
      redirect_to post_path(@post)
    else 
      render :edit 
    end
  end

  def incr_likes
    @post = set_post
    count = params[:post] && params[:post][:likes].to_i
    if count
      @post.likes += count
      @post.save
    end
    redirect_to post_path(@post)
    # redirect path
  
  end

  private

  def set_post
    Post.find(params[:id])
  end
  
  def post_params
    # byebug
    params.require(:post).permit(
      :title,
      :content,
      :likes, 
      :blogger_id,
      :destination_id
    )
  end

end
