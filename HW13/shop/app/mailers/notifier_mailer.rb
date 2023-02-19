class NotifierMailer < ApplicationMailer
  def new_mail(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Your order was created successfully')
  end
end
