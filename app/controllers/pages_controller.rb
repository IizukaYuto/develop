class PagesController < ApplicationController
  before_action :sign_in_required, only: [:name , :kanri]
  def index
  end
  
  def kanri
    
  end
end
