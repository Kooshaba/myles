module Registration
  class BaseController < ApplicationController
    before_filter :authenticate_user!
  end
end
