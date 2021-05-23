class SchedulesAdminController < ApplicationController
  before_action :authenticate_admin!
  
  def self.search(search)
    if search
       
    else
    end
  end
  def index
    @schedules = Schedule.all
  end
  
  def fix
  end
end
