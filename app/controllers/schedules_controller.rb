class SchedulesController < ApplicationController
  before_action :authenticate_user!
  def my_index
      @schedules = Schedule.where(user_id: current_user.id)
      @schedule_name = current_user.name
  end
  
  def start_time
      
      schedule = Schedule.new
      schedule.user_id = current_user.id
      schedule.start_time = Time.now
      schedule.save
      if schedule.save
         redirect_to root_path, success:"出勤登録しました"
      else
         redirect_to root_path, danger:"登録に失敗しました"
      end
  end

  def end_time
      
      #保存された日時を降順
      @schedule = Schedule.where('user_id = ?', current_user.id).order("created_at DESC").first
      
         @before_schedule = Schedule.where('user_id = ?', current_user.id).order("created_at DESC").second
         
                
      if    @before_schedule && !@before_schedule.end_time
            flash.now[:danger] = '前回分退勤入力漏れ'
            #今回分保存
            @schedule.end_time = Time.now
            @schedule.save
      elsif @before_schedule.nil?
            flash.now[:danger] = '出勤記録があリません'
      end
        #start_time有、end_time無
      if    @schedule && !@schedule.end_time
            @schedule.end_time = Time.now
            @schedule.save
            flash[:success] ="お疲れ様でした"
        #start_time有、end_time有
      elsif @schedule.nil?
            flash[:danger] = "勤怠を確認してください"
      elsif @schedule && @schedule.end_time
            flash[:danger] = "勤怠を確認してください"
      end
      redirect_to root_path

  end
  
end
