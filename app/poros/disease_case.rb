class DiseaseCase
  attr_reader :state, :year, :current_week, :disease, :current_week_cases, :cumulative_current, :cumulative_last, :coordinates

  def initialize(attributes, current_week_cases = 0, cumulative_current = nil, cumulative_last = nil, coordinates = nil)
    @state = attributes[:states]
    @year = attributes[:year]
    @current_week = attributes[:week].to_i
    @disease = attributes[:label]
    @current_week_cases = attributes[:m1].to_i
    @cumulative_current = attributes[:m3]&.to_i
    @cumulative_last = attributes[:m4]&.to_i
    @coordinates = attributes[:geocode][:coordinates]
  end
end