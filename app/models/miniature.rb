class Miniature < ApplicationRecord
  STATUSES = { "unpainted" => "Sem pintura", "in_progress" => "Em pintura", "painted" => "Pintada" }.freeze
  belongs_to :category
  validates :name, presence: true, length: { maximum: 120 }
  validates :manufacturer, :universe, :scale, length: { maximum: 100 }
  validates :notes, length: { maximum: 2000 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10000 }
  validates :painting_status, inclusion: { in: STATUSES.keys }
  scope :alphabetical, -> { order(:name) }

  def status_label
    STATUSES.fetch(painting_status)
  end
end
