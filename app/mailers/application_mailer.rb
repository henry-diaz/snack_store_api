class ApplicationMailer < ActionMailer::Base
  # Default from, but in our case we use a gmail account to send the email.
  # Gmail don't change the from user, for security reasons
  default from: 'no-reply@snack-store-api.com'
  layout 'mailer'

  # SMTP config options, we get this from the info saved in the credentials.yml.enc
  # Remember that you can always edit this credentials with the command:
  # EDITOR=nano rails credentials:edit (Change nano to your favorite text editor)
  def delivery_options
    {
      address:              Rails.application.credentials.dig(:email, :address),
      port:                 Rails.application.credentials.dig(:email, :port),
      domain:               Rails.application.credentials.dig(:email, :domain),
      user_name:            Rails.application.credentials.dig(:email, :user_name),
      password:             Rails.application.credentials.dig(:email, :password),
      authentication:       Rails.application.credentials.dig(:email, :authentication),
      enable_starttls_auto: Rails.application.credentials.dig(:email, :enable_starttls_auto)
    }
  end

  def new_user(user)
    # Generic email to send after a user create
    to   = "#{user.name} <#{user.email}>"
    @user = user

    mail to: to,
         subject: 'Welcome to the Snack Store API',
         delivery_method_options: delivery_options
  end

  def new_admin(admin)
    # Generic email to send after a admin create
    to   = "#{admin.name} <#{admin.email}>"
    @admin = admin

    mail to: to,
         subject: 'Welcome to the Snack Store API Panel',
         delivery_method_options: delivery_options
  end
end
