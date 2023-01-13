class Article
  attr_reader :id,
              :article_id,
              :author,
              :journal,
              :title,
              :year,
              :date,
              :isbn_issn,
              :keywords,
              :abstract,
              :url,
              :doi


  def initialize(attributes)
    if attributes[:id]
      @id = attributes[:id]
    else
      @id = attributes[:record_number]
    end
    @article_id = attributes[:record_number]
    @author = attributes[:author]
    @journal = attributes[:secondary_title]
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
