class House < ApplicationRecord
  belongs_to :owner
  belongs_to :city
end
