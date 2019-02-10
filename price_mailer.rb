require "action_mailer"
require "yaml"

CONFIG = YAML.load_file("./config.yml")


ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  enable_starttls_auto: true,
  authentication: :login,
  address: "smtp.gmail.com",
  port: 587,
  user_name: CONFIG["gmail"]["user_name"],
  password: CONFIG["gmail"]["password"] }


class PriceMailer < ActionMailer::Base
  def send_mailer(body)
    mail(
      to: CONFIG["gmail"]["to"],
      from: CONFIG["gmail"]["to"],
      subject: "Notify: 93%",
      body: "93%以下の値段のギフト券が出品されてますよ!!\n#{body}")
  end
end
