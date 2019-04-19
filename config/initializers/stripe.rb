Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => ENV['STRIPE_SECRET_KEY'],
  :admin_user => ENV['USER_ID'],
  :admin_password => ENV['PASSWORD']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
