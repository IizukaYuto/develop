class PagesController < ApplicationController
  before_action :user_signed_in?, only: [:user_page]
  before_action :admin_signed_in?,only: [:kanri]
  def user_page
  end
  
  def kanri
    
  end
end
