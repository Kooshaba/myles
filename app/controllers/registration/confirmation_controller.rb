module Registration
  class ConfirmationController < BaseController
    def new
    end

    def show
    end

    def create
      # TODO - Do payment

      flash[:notice] = "Your information has been submitted."
      redirect_to registration_confirmation_path
    end
  end
end
