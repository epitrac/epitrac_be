class DiseaseCaseService 

  def self.conn 
    Faraday.new(url: "https://data.cdc.gov")
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.diseases_by_state(state)
    get_url("/resource/x9gk-5huc.json?states=#{state}&week=#{(Date.today-14).cweek}")
  end
end