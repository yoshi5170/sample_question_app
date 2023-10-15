class Choice < ApplicationRecord
  belongs_to :diagnosis_question
  has_many :user_choices, dependent: :destroy
end
