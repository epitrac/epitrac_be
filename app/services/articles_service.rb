class ArticlesService 
  def self.conn 
    Faraday.new(url: "http://api.plos.org" ) do |faraday|
      faraday.params["api_key"] = ENV["article_api_key"]
    end
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.articles_by_disease(disease)
    get_url("/search?q=abstract:#{disease}")
  end
end