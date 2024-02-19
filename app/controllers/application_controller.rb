# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  # def go_home
  #   if user_signed_in?
  #     if current_user && current_user.superuser?
  #       redirect_to tenants_path
  #     else
  #       redirect_to orders_path
  #     end
  #   else
  #     redirect_to new_user_session_path
  #   end
  # end
end
