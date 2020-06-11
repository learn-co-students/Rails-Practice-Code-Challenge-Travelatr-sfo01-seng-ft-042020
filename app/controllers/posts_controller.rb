class PostsController < ApplicationController 
    def new
        @post = Post.new
    end
    def create
        @post = Post.create(post_params)
        redirect_to post_path(@post)
    end
    def show
        @post = Post.find(params[:id])
    end 

    private
    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end
end 