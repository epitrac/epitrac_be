class UserArticleService
  def self.conn
    Faraday.new(url: "https://data.cdc.gov/resource/biid-68vb.json" )
  end

  def self.get_url(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end

  def self.articles_by_record(user_articles)
    user_articles.map do |user_article|
      json = get_url("?record_number=#{user_article[:article_id]}")
      json[0][:id] = user_article[:id]
      json
    end
  end
end
