module Registration
  class RecipientInfoController < BaseController
    def new
      @recipient = Recipient.new(user: current_user)
      @recipient.build_address
    end

    def create
      recipient = Recipient.new(update_parameters)

      if recipient.save
        flash[:notice] = "Info saved successfully."
        redirect_to new_registration_confirmation_path
      else
        flash[:alert] = "An unexpected error occurred."
        render :new
      end
    end

    private

    def update_parameters
      params.require(:recipient).permit(:first_name, :last_name, :user_id, address: [
          :address1, :address2, :city, :state, :zip
        ])
    end
  end
end
