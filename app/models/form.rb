class Form < ApplicationRecord
  validates :topic, presence: true
  validates :from, presence: true
  validates :name, presence: true
  validates :comments, presence: true
  # after_create :send_form_notification

  def send_form_notification
    FormMailer.send_email_notification(self).deliver_now
  end

  def send_wf_email
    WFEmailMailer.send_wf_email(self).deliver_now
  end
end
