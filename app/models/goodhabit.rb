class Goodhabit < ApplicationRecord
  validates_presence_of :goodhabit, :description, :timesperweek
  validates :timesperweek, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :user
  has_many :goalcheckins
end
