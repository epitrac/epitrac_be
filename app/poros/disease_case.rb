class DiseaseCase 
  attr_reader :id,
              :state, 
              :year, 
              :current_week, 
              :disease, 
              :cumulative_current, 
              :cumulative_last, 
              :geocode,
              :current_week_cases
  def initialize(attributes)
    @id = nil 
    @state = attributes[:states]
    @year = attributes[:year]
    @current_week = attributes[:week]
    @disease = attributes[:label]
    @current_week_cases = attributes[:m2]
    @cumulative_current = attributes[:m3]
    @cumulative_last = attributes[:m4]
    @geocode = attributes[:geocode]
  end
end