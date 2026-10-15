class Category < ApplicationRecord
  has_many :miniatures, dependent: :restrict_with_error
  validates :name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 80 }
  validates :description, length: { maximum: 500 }
  scope :alphabetical, -> { order(:name) }
end
