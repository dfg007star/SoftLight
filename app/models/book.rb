class Book < ApplicationRecord
  belongs_to :publisher

  validates :title, presence: true
end
