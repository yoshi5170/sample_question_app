class DiagnosisQuestion < ApplicationRecord
  has_many :choices, dependent: :destroy
end
