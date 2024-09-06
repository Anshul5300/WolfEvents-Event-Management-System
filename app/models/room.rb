class Room < ApplicationRecord
  has_many :event, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
