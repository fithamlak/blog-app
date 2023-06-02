class Api::V0::BaseController < ApplicationController
  skip_before_action :configure_permitted_parameters
end
