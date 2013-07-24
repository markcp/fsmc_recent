class Movie < ActiveRecord::Base

  has_many :viewings

  before_validation :build_title_index

  validates :title, presence: true
  validates :director, presence: true
  validates :year, presence: true, numericality: true
  validates :skandies_year, numericality: true, allow_nil: true, allow_blank: true
  validates :short, inclusion: { in: [true, false] }
  validates :title_index, presence: true

  def build_title_index
    self.title_index = self.title.sub(/(?i)^(The|A|An) (.*)$/,'\2, \1');
  end
end
