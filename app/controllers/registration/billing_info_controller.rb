module Registration
  class BillingInfoController < BaseController
    def new
      @billing_info = BillingDetail.new(user_id: current_user.id)
    end

    def create
      #TODO - Persist billing info
      redirect_to new_registration_recipient_info_path
    end
  end
end
