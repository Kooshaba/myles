module Registration
  class ConfirmationController < BaseController
    def new
      # @recipient = current_user.recipient
      @recipient = current_user.build_recipient(first_name: "grandma") # FIXME - Use above line instead of this one
    end

    def show
      # @recipient = current_user.recipient
      @recipient = current_user.build_recipient(first_name: "grandma") # FIXME - Use above line instead of this one
    end

    def create
      # TODO - Do payment

      flash[:notice] = "Your information has been submitted."
      redirect_to registration_confirmation_path
    end
  end
end
