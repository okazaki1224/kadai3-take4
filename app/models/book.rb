class Book < ApplicationRecord
  has one attached:image
  belongs_to :user
end
