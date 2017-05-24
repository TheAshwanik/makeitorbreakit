class Goalcheckin < ApplicationRecord
  belongs_to :user
  belongs_to :goodhabit
  def start_time
   self.checkintime
 end
end
