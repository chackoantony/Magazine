class Tag < ApplicationRecord
  has_many :sub_tags, class_name: 'Tag', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_tag, class_name: 'Tag', foreign_key: 'parent_id'
end
