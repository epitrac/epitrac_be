class DiseaseCaseSerializer 
  include JSONAPI::Serializer 
  attributes :state, 
            :year, 
            :current_week, 
            :disease, 
            :cumulative_current, 
            :cumulative_last, 
            :geocode, 
            :id, 
            :current_week_cases
end