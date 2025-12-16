class Case < ApplicationRecord
  has_many :evidence

  enum phases: {
    collection:  "collection",
    analysis:    "analysis",
    containment: "containment",
    reporting:   "reporting",
    closed:      "closed"
  }

  validates :name, presence: true
  validates :phase, presence: true, inclusion: { in: phases.keys }

  scope :active, -> { where.not(phase: "closed") }
  scope :recent, -> { order(created_at: :desc) }
  scope :by_category, ->(category) { where(category: category) }

  def to_param
    uuid
  end
end
