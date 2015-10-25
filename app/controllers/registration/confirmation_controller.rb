module Registration
  class ConfirmationController < BaseController
    ANNUAL_FEE_SIMPLIFY_PLAN_ID = "do5qo7jX"

    def new
    end

    def create
      do_payment

      flash[:notice] = "Your information has been submitted."
      redirect_to registration_confirmation_path
    end

    private

    def do_payment
      customer = Simplify::Customer.create "token" => current_user.billing_detail.simplify_token,
        "email" => current_user.email,
        "name" => current_user.full_name,
        "reference" => current_user.id,
        "subscriptions" => [
          {
            "plan" => ANNUAL_FEE_SIMPLIFY_PLAN_ID
          }
        ]

      card = customer["card"]
      current_user.billing_detail.update simplify_customer_id: customer["id"],
        card_last_four_digits: card["last4"],
        card_exp_month: card["expMonth"],
        card_exp_year: card["expYear"],
        card_type: card["type"]
    end
  end
end
