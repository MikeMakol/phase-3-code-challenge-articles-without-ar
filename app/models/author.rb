require_relative './magazine.rb'
require_relative './article.rb'
class Author
  attr_accessor :name

  def initialize(name)
    @name = name
  
  end

  def articles
    Article.all.select { |article| article.author == self }
  end

  def magazines
    mag_inst = articles.map { |article| article.magazine }
    mag_inst.uniq
  end

  def add_article(magazine, title)
    Article.new(magazine, self, title)
  end

  def topic_areas
    magazines.map { |magazine| magazine.category }
  end

end
