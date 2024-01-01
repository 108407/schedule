class Schedule < ApplicationRecord
   validates :title, length: { in: 0..20 }, presence: true
   validates :memo, length: { in: 0..500 }
   validates :start, presence: true
   validates :finish, presence: true

   validate :date_before_finish
   def date_before_finish
      return false if start.blank? || finish.blank?
      if finish < start
      errors.add(:finish, "は開始日以降のものを選択してください")
      end
   end
end
