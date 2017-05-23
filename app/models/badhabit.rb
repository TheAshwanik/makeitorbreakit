class Badhabit < ApplicationRecord
  validates_presence_of :badhabit, :description, :totalnumofdays
  validates :totalnumofdays, numericality: { only_integer: true, greater_than: 0 }
  belongs_to :user
  has_many :badhabitcheckins
end
