module ReportsHelper
  def contributor?(contributors, p)
    contributors.map(&:user_id).include?(p.id)
  end
end
