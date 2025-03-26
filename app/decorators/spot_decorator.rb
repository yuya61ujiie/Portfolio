class SpotDecorator < Draper::Decorator
  delegate_all

  def average_star
    average = object.comments.average(:rating)&.round
    case average
    when 0
      ""
    when 1
      "★☆☆☆☆"
    when 2
      "★★☆☆☆"
    when 3
      "★★★☆☆"
    when 4
      "★★★★☆"
    when 5
      "★★★★★"
    end
  end

end
