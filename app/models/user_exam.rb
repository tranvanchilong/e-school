class UserExam < ApplicationRecord
  belongs_to :exam
  belongs_to :user
end
