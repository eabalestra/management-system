# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  # before_action :authenticate_user!

  # layout :layout_by_resource

  # private

  # def layout_by_resource
  #   if devise_controller?
  #     'devise'
  #   else
  #     'application'
  #   end
  # end
end
