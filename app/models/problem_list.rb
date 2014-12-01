class ProblemList < ActiveRecord::Base
  validates :title, presence: true,
            length: {minimum: 1}

  #description


  has_many :problems


end
