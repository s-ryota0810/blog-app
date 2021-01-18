# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  
  def current_user
    ActiveDecorator::Decorator.instance.decorate(super) if super.present?
    super
  end

  def default_url_options  #before_actionで指定する必要はない
    { locale: I18n.locale }
  end

  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
