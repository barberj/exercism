class ResistorColorDuo
  COLOR_MAP = {
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }.freeze

  COLORS = COLOR_MAP.keys.freeze

  def self.value(colors)
    colors.shift(2).reduce("") do |value, color|
      "#{value}#{COLOR_MAP[color.downcase]}"
    end.to_i
  end
end
