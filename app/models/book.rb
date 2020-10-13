class Book < ApplicationRecord
  belongs_to :publisher

  validates :title, presence: true
  validates :publisher_id, presence: true
end
