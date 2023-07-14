require 'stripe'

module StripeWrapper
  class CheckoutSession
    attr_reader :errors, :session, :payment_intent, :charge, :customer, :balanced_transaction

    def self.create_checkout_session(product_name:, product_unit_amount:, 
                                 product_quantity:, payment_intent_description:,
                                 payment_intent_suffix:, customer_email:,
                                 billing_address:, submit_type:,
                                 success_url:, cancel_url:)

      Stripe::Checkout::Session.create({
        payment_method_types: ['card'],
        line_items: [{
          price_data: {
            currency: 'usd',
            product_data: {
              name: product_name,
              images: ['https://drsw10gc90t0z.cloudfront.net/AcuCustom/Sitename/DAM/434/Books_1920_X_1080_copy.jpg']
            },
            unit_amount: product_unit_amount,
          },
          quantity: product_quantity,
        }],
        payment_intent_data: {
          description: payment_intent_description,
          statement_descriptor_suffix: payment_intent_suffix
        },
        mode: 'payment',
        customer_email: customer_email,
        billing_address_collection: billing_address,
        submit_type: submit_type,
        success_url: success_url,
        cancel_url: cancel_url
      })
    end

    def initialize
      @errors = []
      @payment_intent = nil
      @session = nil
      @charge = nil
      @customer = nil
      @balanced_transaction = nil
    end

    def fetch_session_and_other_details(session_id)
      @session = Stripe::Checkout::Session.retrieve(session_id)
      @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
      @charge = @payment_intent.charges.first
      @customer = Stripe::Customer.retrieve(@session.customer)
      @balanced_transaction = Stripe::BalanceTransaction.retrieve(@charge.balance_transaction)
    end

    def update_charge_description(description)
      @charge.description = description
      @charge.save
    end

    def update_customer_description(description)
      @customer.description = description
      @customer.save
    end
  end
end
