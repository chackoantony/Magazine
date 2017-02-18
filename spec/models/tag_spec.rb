require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  it 'has many sub tags' do
    tag = create(:tag)
    create_list(:tag, 2, parent_id: tag.id)
    expect(tag.sub_tags.count).to eq 2
  end

  it 'belongs to a tag' do
    tag = create(:tag)
    tags = create_list(:tag, 2, parent_id: tag.id)
    expect(tags.first.parent_tag).to eq tag
  end  

end
