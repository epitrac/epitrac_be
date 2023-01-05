class ArticleService 
  def self.conn 
    Faraday.new(url: "https://data.cdc.gov/resource/biid-68vb.json" )
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.articles_by_disease(disease)
    get_url("?$where=title like '%25#{disease}%25'")
  end
end