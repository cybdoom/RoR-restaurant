class ReservationValidator < ActiveModel::Validator
  def validate record
    if record.start >= record.end
      record.errors[:base] = 'Reservation period is wrong'
      return
    end

    table_reservations = Reservation.where(table: record.table)
    return if table_reservations.empty?

    table_reservations.each do |reservation|
      unless record.start > reservation.end || record.end < reservation.start
        record.errors[:base] = 'This table is already reserved'
        break
      end
    end
  end
end
