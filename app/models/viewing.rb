class Viewing < ActiveRecord::Base

  belongs_to :format
  belongs_to :movie

  validates :movie_id, presence: true
  validates :format_id, presence: true
  validates :date, presence: true
  validates :rating, numericality: { only_integer: true,
                                     greater_than: 0,
                                     less_than_or_equal_to: 100 }

  validates_date :date, between: ['1969-08-30','2069-08-30']
end
