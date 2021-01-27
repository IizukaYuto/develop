class SchedulesController < ApplicationController
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
      #最新のレコード取得
      schedule = Schedule.last
      check = true
      #前回データがあるか
      if  Schedule.exists?(schedule.id - 1)
          check_schedule = Schedule.find(schedule.id - 1)
          if check_schedule.end_time.nil?
             check = false
          end
      end
      
      if  schedule.end_time.nil? && check == true
          schedule.end_time = Time.now  
          schedule.save
          redirect_to root_path, success:"お疲れ様でした"
      else
          redirect_to root_path, danger:"前回分入力漏れ"
          #今回分保存
          schedule.end_time = Time.now
          schedule.save
      end
  end
end
