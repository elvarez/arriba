class FavoriteMailer < ActionMailer::Base
  default from: "szuletett@gmail.com"

  def new_comment(user, post, comment)

    headers["Message-ID"] = "<comments/#{comment.id}@arriba.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@arriba.com>"
    headers["References"] = "<post/#{post.id}@arriba.com>"
    
    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
