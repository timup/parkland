Devise.setup do |config|
  config.secret_key = Rails.application.secrets.devise_secret_key
  #config.mailer = Devise::Mailer 
  config.mailer_sender = '"Parkland" <admin@parkland.io>'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  # config.default_scope = :admin
  # config.sign_out_all_scopes = true
  config.sign_out_via = :delete
end
