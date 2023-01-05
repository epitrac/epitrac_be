class DiseaseCaseService
  def self.all_states_cases
    response = connection.get("")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.connection
    Faraday.new(url: "https://data.cdc.gov/resource/x9gk-5huc.json")
  end
end