SMTP_SETTINGS = {
  address: ENV.fetch("SMTP_ADDRESS"), # example: "smtp.mandrill.com"
  authentication: :plain,
  domain: ENV.fetch("SMTP_DOMAIN"), # example: "myapp.com"
  enable_starttls_auto: true,
  password: ENV.fetch("SMTP_PASSWORD"),
  port: "587",
  user_name: ENV.fetch("SMTP_USERNAME")
}
