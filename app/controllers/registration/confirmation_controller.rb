module Registration
  class ConfirmationController < BaseController

    def new
    end

    def create
      Mastercard.subscribe current_user

      flash[:notice] = "Your information has been submitted."
      redirect_to registration_confirmation_path
    end
  end
end
