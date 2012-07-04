class Notifier < ActionMailer::Base
  default from: "ticketee@gmail.com"

  def comment_updated(comment, user)
    @comment, @user = comment, user
    mail(:to => user.email,
         :subject => "[ticketee] #{comment.project.name} - #{comment.ticket.title}")
  end
end
