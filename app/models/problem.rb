class Problem < ActiveRecord::Base
  validates :number, numericality: true,
            presence: true,
            uniqueness: true


  belongs_to :problem_list
  has_many :results
  has_many :answers


  validate :must_exists

  has_attached_file :figure, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => nil

  validates_attachment_content_type :figure, :content_type => /\Aimage\/.*\Z/


  private
  def must_exists
    unless ProblemList.exists?(id: self.problem_list)
      errors.add(:problem_list_id, 'must exists')
      return
    end
    errors.add(:problem_list_id, 'can have not more than four problems') if self.problem_list.problems.count >= 5
    if (self.body == nil || self.body.length == 0) && !(self.figure.file?)
      errors.add(:body, 'or image must exists')
    end
  end
end
