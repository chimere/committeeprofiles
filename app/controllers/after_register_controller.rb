class AfterRegisterController < ApplicationController
  before_filter :authenticate_user!
  
  include Wicked::Wizard
  
  steps :personal, :education, :career
  
  def show
    @user = current_user
    render_wizard
  end
  
  def update
    @user = current_user
    @user.update_attributes(params[:user])
    render_wizard @user
  end
  
private

  def redirect_to_finish_wizard_path
    redirect_to root_url, notice: "Thank you for signing up."
  end
  
end
