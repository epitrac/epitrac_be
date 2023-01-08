class UserArticleService
  def self.conn
    Faraday.new(url: "https://data.cdc.gov/resource/biid-68vb.json" )
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.articles_by_record(record_numbers)
    record_numbers.map do |record_number|
      get_url("?record_number=#{record_number}")
    end
  end
end
