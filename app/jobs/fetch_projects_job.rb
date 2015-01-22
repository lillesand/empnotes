class FetchProjectsJob < ActiveJob::Base
  queue_as :default

  def perform(casAuth)
    bekk_intern_api = BekkIntern.new(casAuth)
    employees = Employee.all

    today = Date.today
    # %W gives zero indexed week number
    week_number = today.strftime('%W').to_i + 1
    employees.each do |e|
      e.staffing = bekk_intern_api.fetch_hours_for(e.bekk_id, week_number)
      puts "#{e.name}: #{bekk_intern_api.fetch_hours_for(e.bekk_id, week_number)}"
      e.save
    end
  end
end
