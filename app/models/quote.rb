class Quote < ActiveRecord::Base
  attr_accessible :body, :author_name, :author_description
  validates :body, presence: true

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  def previous
    Quote.where(["id < ?", id]).last
  end

  def next
    Quote.where(["id > ?", id]).first
  end 
end