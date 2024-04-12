class SupportRequestMailer < ApplicationMailer
  default from: 'Arsov Winery Support <support@arsovwinery.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_request_mailer.respond.subject
  #
  def respond(support_request)
    @support_request = support_request

    mail to: @support_request.email, subject: "Re: #{@support_request.subject}"
  end
end
