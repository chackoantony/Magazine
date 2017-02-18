class Article < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :title, :content, presence: true

  include PgSearch
 
  pg_search_scope :search, against: [:title, :content],  associated_against: {tags: :name}
            
              
  
end
