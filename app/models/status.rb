class Status < ActiveRecord::Base
  belongs_to :user
  belongs_to :report
  has_many :attachments, :as => :attachable

  STATES = ['Open', 'Confirmed', 'Ongoing', 'Resolved']
end
