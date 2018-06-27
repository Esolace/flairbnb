Rails.configuration.stripe = {
    :publishable_key => 'pk_test_igIkCNVkhrHRBDZx8jdVhkle',
    :secret_key => 'sk_test_vRZUt7VaFUyRMCjUuRtEM09y'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]