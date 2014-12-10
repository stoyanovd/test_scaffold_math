class User < ActiveRecord::Base
  validates :name, presence: true,
            length: {minimum: 1}

  has_many :results

  has_secure_password

end
