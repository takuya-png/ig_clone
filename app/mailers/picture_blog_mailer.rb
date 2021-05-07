class PictureBlogMailer < ApplicationMailer
  def picture_blog_mail(picture_blog)
    @picture_blog = picture_blog
    mail to: @picture_blog.user.email, subject: "お問い合わせの確認メール"
  end
end
