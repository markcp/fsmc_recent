class Format < ActiveRecord::Base
  has_many :viewings
  default_scope -> { order('name') }

  validates :name, presence: true
end
