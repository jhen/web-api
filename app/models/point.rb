class Point < ActiveRecord::Base

  belongs_to :user
  belongs_to :restaurant

  ASK_POINT     = 1
  EAT_POINT     = 3
  CHECKIN_POINT = 5
  SELFIE_POINT  = 7
  GROUPIE_POINT = 7

  delegate :name, to: :restaurant, prefix: true

  def self.add_point(user, restaurant, point_type='')
    Point.create!(user: user, restaurant: restaurant, point_type: point_type, point: point_equivalent(point_type))
  end

  def self.total_points(user)
    user.points.sum(:point)
  end

  def self.point_equivalent(type = 'ask')
    case type
      when 'ask'
        ASK_POINT
      when 'eat'
        EAT_POINT
      when 'checkin'
        CHECKIN_POINT
      when 'selfie'
        SELFIE_POINT
      when 'groupie'
        GROUPIE_POINT
      else
        0
    end
  end

end
