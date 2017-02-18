class Tag < ApplicationRecord
  has_many :sub_tags, class_name: 'Tag', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_tag, class_name: 'Tag', foreign_key: 'parent_id'
  has_and_belongs_to_many :articles
  
  scope :parent_tags, -> {where(parent_id: nil)}
  scope :sub_tags, -> {where.not(parent_id: nil) }
end
