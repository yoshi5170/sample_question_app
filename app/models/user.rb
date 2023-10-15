class User < ApplicationRecord
  has_many :user_choices, dependent: :destroy
end
