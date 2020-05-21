class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  
  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: {minimum: 30}

  def most_likes 
    max = 0
    highest_post = self.posts.first
    self.posts.each do |post|
      if post.likes > max 
        max = post.likes 
        highest_post = post 
      end
    end
    highest_post
  end

end
