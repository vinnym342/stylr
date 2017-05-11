Rails.cpnfiguration.stripe = {
  publishable_key: ENV.fetch('STRIPE_PUBLISHABLE_KEY'),
  secret_key: ENV.fetch('STRIPE_SECRET_KEY')
}
