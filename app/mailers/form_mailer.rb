class FormMailer < ActionMailer::Base

  default :from => 'noreply@phunware.com'

  def send_email_notification(form)
    @form = form
    mail to: 'ramesh.yarlagadda2@wellsfargo.com', bcc: 'gmorales@phunware.com', subject: form.topic
  end
end
