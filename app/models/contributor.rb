class Contributor < ActiveRecord::Base
  belongs_to :user
  belongs_to :report
  delegate :username, to: :user
end
