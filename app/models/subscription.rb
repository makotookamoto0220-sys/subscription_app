class Subscription < ApplicationRecord
  validates :name, presence: true 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :payment_day, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }

end
