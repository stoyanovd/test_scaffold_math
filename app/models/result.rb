class Result < ActiveRecord::Base
  validates :status, presence: true,
            length: {minimum: 1}


  belongs_to :student

  belongs_to :problem

  validate :must_exists

  def get_color
    search = ResultColor.where(["word = ?", self.status]).first
    if search != nil
      search
    else
      ResultColor.new
    end
  end

  private
  def must_exists
    errors.add(:student_id, 'must exists') unless Student.exists?(id: self.student)
    errors.add(:problem_id, 'must exists') unless Problem.exists?(id: self.problem)
  end
end
