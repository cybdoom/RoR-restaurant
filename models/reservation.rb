class Reservation < ActiveRecord::Base
  validates :table, :start, :end, presence: true

  validates_with ReservationValidator
end
