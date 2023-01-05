class DiseaseCaseFacade 
  def self.states_diseases(state, current_week)
    DiseaseCaseService.diseases_by_state(state, current_week).map do |row|
      DiseaseCase.new(row)
    end
  end
end