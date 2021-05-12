class Order < ApplicationRecord
  belongs_to :plan
  belongs_to :user
end
