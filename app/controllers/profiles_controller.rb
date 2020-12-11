class ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  
  def show
    @profile = current_user.profile
  end
  
  def edit
    @profile = current_user.build_profile #has_oneの時はこれ(一つしかないから？
  end
end