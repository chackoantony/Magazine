require 'rails_helper'

RSpec.describe Article, type: :model do
  
  it 'validates title' do 
    expect(Article.new(title: nil).valid?).to eq false
  end

  it 'validates content' do 
    expect(Article.new(title: 'title', content: nil).valid?).to eq false
  end

  describe '#filter' do
    before(:each) do 
      @tag = create(:tag)
      @sub_tag = create(:tag, parent_id: @tag.id) 
      create(:article, title: 'sample')
    end
 
    it 'filters text' do
      create_list(:article, 2, title: 'ruby')
      params = {text: 'ruby'}
      expect(Article.filter(params).count).to eq 2
    end

    it 'filters tags' do
      create_list(:article, 2, title: 'ruby', tag_ids: [@tag.id])
      params = {tag: @tag.id}
      expect(Article.filter(params).count).to eq 2
    end

    it 'filters sub tags' do
      create_list(:article, 2, title: 'ruby', tag_ids: [@sub_tag.id])
      params = {sub_tag: @sub_tag.id}
      expect(Article.filter(params).count).to eq 2
    end

  end

end
