class Mastercard

  ANNUAL_FEE_SIMPLIFY_PLAN_ID = "do5qo7jX"

  def create_payment(shipment)
    Simplify::Payment.create customer: shipment.order.recipient.user.billing_detail.simplify_customer_id,
      amount: shipment.items.sum(:price),
      description: shipment.id.to_s,
      reference: shipment.id.to_s
  end

  def subscribe(user)
    customer = Simplify::Customer.create "token" => user.billing_detail.simplify_token,
      "email" => user.email,
      "name" => user.full_name,
      "reference" => user.id,
      "subscriptions" => [
        {
          "plan" => ANNUAL_FEE_SIMPLIFY_PLAN_ID
        }
      ]

    card = customer["card"]
    user.billing_detail.update simplify_customer_id: customer["id"],
      card_last_four_digits: card["last4"],
      card_exp_month: card["expMonth"],
      card_exp_year: card["expYear"],
      card_type: card["type"]
  end
end
