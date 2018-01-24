class FormMailer < ActionMailer::Base

  default :from => 'norepy@phunware.com'

  def send_email_notification(form)
    @form = form
    # mail(:to => 'gabomorales@me.com', :subject => "Email Send Test")
    # mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    # message_params = {:from => "gmorales@phunware.com",
    #                   :to => "gabomorales@me.com",
    #                   :subject => "Test Email Sent",
    #                   :text => @form.comments}
    # mg_client.send_message ENV['DOMAIN'], message_params
    mail to: 'gmorales@phunware.com', subject: form.topic
  end
end
