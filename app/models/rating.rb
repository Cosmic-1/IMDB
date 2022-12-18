class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  validates_presence_of :movie
  validates_presence_of :user
  validates_inclusion_of :value, in: 1..10
end
