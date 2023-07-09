# Please copy/paste all three classes into this file to submit your solution!
class Article
    attr_reader :title, :author, :magazine
    @@all = []

    def initialize(author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

end

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
  end.uniq

end

class Magazine
  attr_accessor :name, :category
  @@all = []


  def initialize(name, category)
    @name = name
    @category = category
    @@all << self

  end

  def self.all
    @@all
  end

  def contributors
    Article.all.map do |article|
      article.author if article.magazine == self
    end.compact.uniq
  end  
  
  def self.find_by_name(name)
    @@all.find { |magazine| magazine.name == name }
  end  

  def article_titles
    Article.all.select { |article| article.magazine == self }.map(&:title)
  end

  def contributing_authors
    contribs = Hash.new(0)
    Article.all.map do |article|
      if (article.magazine == self)
        contribs[article.author] += 1
      end
    end
    contribs.select { |author, value| value > 1 }.keys
  end
  
end