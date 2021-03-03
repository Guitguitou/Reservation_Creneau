# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[nom prenom password password_confirmation
                                               type_de_jeu sexe email
                                               date_de_naissance numero_de_licence])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[nom prenom password password_confirmation
                                               type_de_jeu sexe email
                                               date_de_naissance numero_de_licence])
  end
end
