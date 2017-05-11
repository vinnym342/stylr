class TransactionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.conversation_payed.subject
  #
  def conversation_payed(current_user,question,price)
    @name = current_user.profile.first_name
    @question = question
    @price = price

    mail to: current_user.email, subject: "Paid to create the conversation"
  end
end
