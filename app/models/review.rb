class Review < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true
  validates :rating, numericality: { only_integer: true }, presence: true, inclusion: { in: (0..5) }
end
