class Public::PostsController < ApplicationController
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        tags = Vision.get_image_data(post_params[:image])
        @post.customer_id = current_customer.id
        if @post.save
          tags.each do |tag|
            @post.tags.create(name: tag)
          end
        redirect_to posts_path
        else
            render :new
        end
    end
    
    def index
        @posts = Post.page(params[:page])
    end
    
    def show
       @post = Post.find(params[:id])
       @post_comment = PostComment.new
    end
    
    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to posts_path
    end
    
    private
    
    def post_params
        params.require(:post).permit(:text, :image)
    end
        
end
