module Registration
  class BillingInfoController < BaseController
    def new
      @billing_info = BillingDetail.new(user_id: current_user.id)
    end

    def create
      billing_info = current_user.create_billing_detail update_parameters

      if billing_info.save
        flash[:notice] = "Info saved successfully."
        redirect_to new_registration_recipient_info_path
      else
        flash[:alert] = "An unexpected error occurred."
        render :new
      end
    end

    private

    def update_parameters
      params.permit(:simplify_token)
    end
  end
end
