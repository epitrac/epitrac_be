class DiseaseCaseFacade 
  def self.states_diseases(state)
    DiseaseCaseService.diseases_by_state(state).map do |row|
      DiseaseCase.new(row)
    end
  end
end