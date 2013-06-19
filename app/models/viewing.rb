class Viewing < ActiveRecord::Base

  validates :movie_id, presence: true
  validates :format_id, presence: true
  validates :date, presence: true
  validates :rating, numericality: { only_integer: true,
                                     greater_than: 0,
                                     less_than_or_equal_to: 100 }
end
