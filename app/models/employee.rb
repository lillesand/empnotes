class Employee < ActiveRecord::Base

  has_many :notes, -> { order('added_at desc') }

  def last_note
    return nil if notes.size < 1

    notes[0]
  end

  def days_since_last_chat
    return Float::INFINITY if last_note == nil
    (Time.now.to_date - last_note.added_at.to_date).to_i
  end

  def happiness
    return 'Good' if last_note == nil

    last_note.happiness
  end

end
