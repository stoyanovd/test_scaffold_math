class Problem < ActiveRecord::Base
  validates :number, numericality: true,
            presence: true
  validates :body, presence: true,
            length: {minimum: 1}


  belongs_to :problem_list
  has_many :results


  validate :must_exists

  has_attached_file :figure, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => "/images/:style/figure.png"

  validates_attachment_content_type :figure, :content_type => /\Aimage\/.*\Z/


  private
  def must_exists
    errors.add(:problem_list_id, 'must exists') unless ProblemList.exists?(id: self.problem_list)
    errors.add(:problem_list_id, 'can have not more than four problems') if self.problem_list.problems.count >= 5
  end
end
