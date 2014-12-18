class Answer < ActiveRecord::Base

  has_attached_file :figure, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :default_url => nil
  validates_attachment_content_type :figure, :content_type => /\Aimage\/.*\Z/


  belongs_to :user

  belongs_to :problem

  validate :must_exists

  private
  def must_exists
    errors.add(:user_id, 'must exists') unless User.exists?(id: self.user)
    errors.add(:problem_id, 'must exists') unless Problem.exists?(id: self.problem)
    if (self.body == nil || self.body.length == 0) && !(self.figure.file?)
      errors.add(:body, 'or image must exists')
    end
  end

end
