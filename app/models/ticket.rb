class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event
  belongs_to :room

  before_create :check_event_seats
  #after_create :decrease_event_seats
  #after_destroy :increase_event_seats
  before_update :store_old_quantity

  def store_old_quantity
    @old_quantity = self.quantity_was
  end

  private

  def check_event_seats
    if event.seats_left-quantity <= 0
      errors.add(:base, "Cannot register for event. Event is full")
      throw(:abort)
    end
  end

end
