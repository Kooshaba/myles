module Registration
  class RecipientInfoController < BaseController
    def new
      @recipient = Recipient.new(user_id: current_user.id).build_address
    end

    def create
      #TODO - Persist recipient info
      redirect_to new_registration_recipient_info_path
    end
  end
end
