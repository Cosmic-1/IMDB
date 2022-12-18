class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  has_many :ratings, dependent: :destroy

  def can_rate? movie
    ratings.where(movie_id:movie.id).empty?
  end
end
