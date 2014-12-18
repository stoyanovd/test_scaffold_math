class ProblemList < ActiveRecord::Base
  validates :title, presence: true,
            length: {minimum: 1},
            uniqueness: true

  #description


  has_many :problems


end
