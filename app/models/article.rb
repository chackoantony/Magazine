class Article < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :title, :content, presence: true

  
  def self.filter params
  	params.delete_if { |k, v| v.blank? }
  	articles = where('title @@ :q or content @@ :q', q: params[:text])
    tag = params.fetch(:sub_tag, params[:tag])
    if tag.present?  
  	   articles = Article.joins(:tags).where('tags.id = ?', tag)
  	end
  	articles   
  end           
              
  
end
