class Result < ActiveRecord::Base
  validates :status, presence: true,
            length: {minimum: 1}


  belongs_to :user

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
    errors.add(:user_id, 'must exists') unless User.exists?(id: self.user)
    errors.add(:problem_id, 'must exists') unless Problem.exists?(id: self.problem)
  end
end
