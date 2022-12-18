class Movie < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_one_attached :poster
  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true, length: { minimum: 2 }

  after_destroy :poster do
    poster.purge
  end

  paginates_per 5

  def rating_average
    ratings.empty? ? 0 : ratings.sum(:value) / ratings.size
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
