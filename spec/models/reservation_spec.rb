RSpec.describe Reservation do
  before :all do
    Reservation.delete_all
  end

  after :each do
    Reservation.delete_all
  end

  it "creates two reservations for the same table without time crossing" do
    time_point = Time.now
    Reservation.create({
      table: 1,
      start: time_point,
      end: time_point + 60 * 60
    })

    second_reservation = Reservation.create({
      table: 1,
      start: time_point + 60 * 60 + 1,
      end: time_point + 60 * 60 * 2
    })

    expect(second_reservation.errors).to be_empty
  end

  it "fails to creates two reservations for the same table with time crossing" do
    time_point = Time.now
    Reservation.create({
      table: 1,
      start: time_point,
      end: time_point + 60 * 60
    })

    second_reservation = Reservation.create({
      table: 1,
      start: time_point - 60 * 60,
      end: time_point + 60 * 60
    })

    expect(second_reservation.errors).not_to be_empty
  end
end
