class Article 
  attr_reader :id,
              :author,
              :title,
              :year,
              :date,
              :isbn_issn,
              :keywords,
              :abstract


  def initialize(attributes)
    @id = attributes[:record_number]
    @author = attributes[:author]
    @title = attributes[:title]
    @year = attributes[:year]
    @date = attributes[:date]
    @isbn_issn = attributes[:isbn_issn]
    @keywords = attributes[:keywords]
    @abstract = attributes[:abstract]
  end
end