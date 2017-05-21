class Goodhabit < ApplicationRecord
  belongs_to :user
  has_many :goalcheckins
end
