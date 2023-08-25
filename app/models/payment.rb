class Payment < ApplicationRecord
  belongs_to :contact

  validates :advanced_amount, presence: true
  validates :amount_deducted, presence: true
end
