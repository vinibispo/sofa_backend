class Plan < ApplicationRecord
  belongs_to :enterprise
  has_one_attached :image
end
