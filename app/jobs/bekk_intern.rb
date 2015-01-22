require 'httparty'
require 'date'

class BekkIntern

  def initialize(casAuth)
    @casAuth = casAuth
  end

  def fetch_hours_for(emp_id, week)
    start_date = Date.commercial(Date.today.year, week, 1)
    end_date = Date.commercial(Date.today.year, week, 7)


    res = HTTParty.get("https://intern.bekk.no/Staffing2/Ansatte/EmployeeStaffingHover?employeeId=#{emp_id}&start=#{start_date}&end=#{end_date}",
      {
        headers: { 'Cookie' => "casAuth=#{@casAuth}" },
        timeout: 2000
      }
    )

    if res.include? 'Logg inn'
      raise "Crap, logged out. Need new cas auth cookie."
    end

    unless res.include? 'Uke '
      raise "Unexpected response from internal system. Response was: #{res}"
    end


    hoursForWeek = ''
    accounts = res.scan(/\s+(?<account>[A-Z]{3}[0-9]{4})\s{1}\((?<hours>[0-9,]+t{1}),/) do |account, hours|
      hoursForWeek = hoursForWeek + "#{account} (#{hours}), " unless account.include? 'ADM'
    end

    #Remove trailing ', '
    hoursForWeek = hoursForWeek[0..-3] if hoursForWeek.length > 2
  end


end
