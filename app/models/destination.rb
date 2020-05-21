class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

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

  def average_blogger_age 
    ages = self.bloggers.map{|b| b.age}
    ages.inject(0.0) { |sum, el| sum + el } / ages.size
  end

end
