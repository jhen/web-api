class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :reports
  validates :username, :presence => true, :uniqueness => true

  ROLES = ['citizen', 'local government', 'national government', 'private sector']

  scope :parties, lambda{ where('users.role != ?', 'citizen') }
end
