class DiseaseCaseSerializer
  include JSONAPI::Serializer
  attributes :state, :year, :current_week, :disease, :current_week_cases, :cumulative_current, :cumulative_last, :coordinates, :id
end