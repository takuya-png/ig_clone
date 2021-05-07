class PictureBlogsController < ApplicationController
  before_action :set_picture_blog, only: [ :show, :edit, :update, :destroy ]

  def new
    if params[:back]
      @picture_blog = PictureBlog.new(picture_blog_params)
    else
      @picture_blog = PictureBlog.new
    end
  end

  def create
    @picture_blog = PictureBlog.new(picture_blog_params)
    @picture_blog.user_id = current_user.id
    if @picture_blog.save
      PictureBlogMailer.picture_blog_mail(@picture_blog).deliver
      redirect_to picture_blogs_path, notice: "投稿できました！"
    else
      render :new
    end
  end

  def update
    if @picture_blog.update(picture_blog_params)
      redirect_to picture_blogs_path, notice: "投稿できました！"
    else
      render :new
    end
  end

  def index
    @picture_blog = PictureBlog.all
  end

  def show
    @favorite = current_user.favorites.find_by(picture_blog_id: @picture_blog.id)
  end

  def edit
    redirect_to picture_blogs_path, notice: "不正操作を記録しました。" unless current_user.id == @picture_blog.user.id
  end

  def confirm
    @picture_blog = PictureBlog.new(picture_blog_params)
    @picture_blog.user_id = current_user.id
    render :new if @picture_blog.invalid?
  end

  def destroy
    @picture_blog.destroy
    redirect_to picture_blogs_path, notice: "削除できました！"
  end

  private

  def picture_blog_params
    params.require(:picture_blog).permit(:title, :content, :image, :image_cache)
  end

  def set_picture_blog
    @picture_blog = PictureBlog.find(params[:id])
  end
end