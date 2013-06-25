class Movie < ActiveRecord::Base

  has_many :viewings

  validates :title, presence: true
  validates :title_index, presence: true
  validates :director, presence: true
  validates :year, presence: true, numericality: true
  validates :skandies_year, numericality: true
  validates :short, inclusion: { in: [true, false] }
end
