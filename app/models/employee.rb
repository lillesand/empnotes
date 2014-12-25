class Employee < ActiveRecord::Base

  has_many :notes, -> { order('added_at desc') }

  def last_chat
    notes
  end

end
