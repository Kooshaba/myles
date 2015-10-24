module Registration
  class ConfirmationController < BaseController
    def show
      # @recipient = current_user.recipient
      @recipient = current_user.build_recipient(first_name: "grandma") # FIXME - Use above line instead of this one
    end
  end
end
