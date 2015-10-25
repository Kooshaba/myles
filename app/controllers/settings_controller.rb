class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def update
    current_user.assign_attributes(update_params)

    if current_user.save
      flash[:notice] = "Account has been updated."
    else
      flash[:alert] = "There was a problem upating our account."
    end

    redirect_to settings_path
  end

  private

  def update_params
    params.require(:user).permit(
      :id, :first_name, :last_name, :email,
      recipient_attributes: [
        :id, :user_id, :first_name, :last_name,
        address_attributes: [
          :id, :recipient_id, :address1, :address2, :city, :state, :zip
        ]
      ]
    )
  end
end
