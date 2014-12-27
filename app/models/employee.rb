class Employee < ActiveRecord::Base

  has_many :notes, -> { order('added_at desc') }

  def last_chat
    if notes.size > 0 then
      notes[0].added_at
    else
      nil
    end
  end

  def days_since_last_chat
    return Float::INFINITY if last_chat == nil
    (Time.now.to_date - last_chat.to_date).to_i
  end

end
