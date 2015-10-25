class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = current_user
  end

  def update

  end

  private

  def update_params

  end
end
