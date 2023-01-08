class Article 
  attr_reader :id,
              :article_id, 
              :author,
              :title,
              :year,
              :date,
              :isbn_issn,
              :keywords,
              :abstract,
              :url,
              :doi 


  def initialize(attributes)
    @id = attributes[:sort_order]
    @article_id = attributes[:record_number]
    @author = attributes[:author]
    @title = attributes[:title]
    @year = attributes[:year]
    @date = attributes[:date]
    @isbn_issn = attributes[:isbn_issn]
    @keywords = attributes[:keywords]
    @abstract = attributes[:abstract]
    @url = attributes[:url]
    @doi = attributes[:doi]

  end
end