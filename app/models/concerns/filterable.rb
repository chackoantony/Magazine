# Module for adding filtering capability for articles
module Filterable
  extend ActiveSupport::Concern

  class_methods do
    
    #Article filter method
    def filter(params)
      params.delete_if { |k, v| v.blank? }
      return self if params.blank?
      articles = self.all
      articles = articles.where('title @@ :q or content @@ :q', q: params[:text]) if params[:text]
      tag = params.fetch(:sub_tag, params[:tag])
      articles = articles.joins(:tags).where('tags.id = ?', tag) if tag.present?
      articles
    end

  end

end