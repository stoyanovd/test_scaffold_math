class Problem < ActiveRecord::Base
  validates :number, numericality: true,
            presence: true
  validates :body, presence: true,
            length: {minimum: 1}


  belongs_to :problem_list
  has_many :results


  validate :must_exists

  private
  def must_exists
    errors.add(:problem_list_id, 'must exists') unless ProblemList.exists?(id: self.problem_list)
  end
end
