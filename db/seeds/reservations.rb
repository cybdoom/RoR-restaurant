10.times do |i|
  Reservation.create({
    table: i + 1,
    start: Time.now,
    end: Time.now + 2 * 60 * 60 + i * 60 * 5
  })
end
