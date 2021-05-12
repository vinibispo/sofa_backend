class Enterprise < ApplicationRecord
  has_one_attached :image
  has_many :plans
end
