#create a new Customer object

require 'stripe'
Stripe.api_key = 'INSERT_SECRET_KEY_HERE'

Stripe::Customer.create({
  description: 'My First Test Customer (created for API docs)',
})
