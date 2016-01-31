class PostsController < ApplicationController
 before_action :find_post, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_journey!, except: [:index, :show]

 def index
  @posts = Post.all.order("created_at desc").paginate(:page => params[:page], :per_page => 7)
 end

 def new
  @post = current_journey.posts.build
 end

 def create
  @post = current_journey.posts.build post_params

  if @post.save
    redirect_to @post, notice: "Thanks for your post"
  else
    render 'new', notice: " There was a problem saving your post"
  end
 end

 def show
 end

 def edit
 end

 def update
  if @post.update post_params
    redirect_to @post, notice: "Your post has been updated"
  else
   render 'edit'
  end
 end

 def destroy
  @post.destroy
  redirect_to posts_path
 end

 private

 def post_params
  params.require(:post).permit(:title, :content, :slug)
 end

 def find_post
  @post = Post.friendly.find(params[:id])
 end

end
