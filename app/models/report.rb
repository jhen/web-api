class Report < ActiveRecord::Base
  acts_as_commentable
  belongs_to :user
  has_many :statuses
  has_many :contributors, dependent: :destroy

  delegate :username, to: :user
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  after_create :create_associated

  def create_associated
    create_status(self.user, Status::STATES[0])
  end

  def tag_party(parties_id=[])
    parties = User.parties.where(id: parties_id)
    self.contributors = []
    parties.each do |party|
      Contributor.where(user_id: party.id, report_id: self.id).first_or_create
    end
  end

  def create_comment(user, comment)
    self.comments.create(user: user, comment: comment)
  end

  def create_status(user, status, message='')
    self.statuses.create(user: user, status: status, message: message)
  end
end