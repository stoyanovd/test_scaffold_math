class ResultColor < ActiveRecord::Base

  after_initialize :init

  def init
    self.red ||= 255
    self.green ||= 255
    self.blue ||= 255
  end

  validates :word, presence: true,
            length: {minimum: 1},
            uniqueness: true

  validates :red, presence: true,
            numericality: true
  validates :green, presence: true,
            numericality: true
  validates :blue, presence: true,
            numericality: true

end
