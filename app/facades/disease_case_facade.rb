class DiseaseCaseFacade
  def self.disease_cases
    data = DiseaseCaseService.all_states_cases
    state_data = data.map do |state_info|
      if state_info[:states] != "US RESIDENTS" && state_info[:states] != "NEW ENGLAND" && state_info[:states] != "MIDDLE ATLANTIC" && state_info[:states] != "NEW YORK CITY" && state_info[:states] != "EAST NORTH CENTRAL" && state_info[:states] != "WEST NORTH CENTRAL" && state_info[:states] != "SOUTH ATLANTIC" && state_info[:states] != "EAST SOUTH CENTRAL" && state_info[:states] != "WEST SOUTH CENTRAL" && state_info[:states] != "MOUNTAIN" && state_info[:states] != "PACIFIC" && state_info[:states] != "US TERRITORIES" && state_info[:states] != "AMERICAN SAMOA" && state_info[:states] != "U.S. VIRGIN ISLANDS" && state_info[:states] != "NON-US RESIDENTS" && state_info[:states] != "TOTAL"
        DiseaseCase.new(state_info)
      end
    end
    state_data.compact
  end
end