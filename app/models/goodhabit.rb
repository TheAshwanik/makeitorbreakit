class Goodhabit < ApplicationRecord
  validates_presence_of :goodhabit, :description, :timesperweek, :category
  validates :timesperweek, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 7 }
  belongs_to :user
  has_many :goalcheckins
end
