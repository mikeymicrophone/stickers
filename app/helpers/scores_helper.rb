module ScoresHelper
  def medal_for score
    if score > 120
      'superdupergold'
    elsif score > 100
      'supergold'
    elsif score > 80
      'gold'
    elsif score > 60
      'silver'
    elsif score > 40
      'bronze'
    end
  end
end
