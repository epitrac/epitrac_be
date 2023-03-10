class DiseaseCase 
  attr_reader :id,
              :state, 
              :year, 
              :current_week, 
              :disease, 
              :cumulative_current, 
              :cumulative_last, 
              :coordinates,
              :current_week_cases
  def initialize(attributes)
    @id = attributes[:sort_order]
    @state = attributes[:states]
    @year = attributes[:year]
    @current_week = attributes[:week].to_i
    @disease = attributes[:label]
    @current_week_cases = attributes[:m1].to_i
    @cumulative_current = attributes[:m3].to_i
    @cumulative_last = attributes[:m4].to_i 
    @coordinates = attributes[:geocode][:coordinates] if attributes[:geocode]
  end
end