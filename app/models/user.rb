class User < ActiveRecord::Base
  validates :name, presence: true,
            length: {minimum: 1},
            uniqueness: true

  has_many :results
  has_many :answers

  has_secure_password

end
