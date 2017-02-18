require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  describe 'POST #create' do
    it 'creates articles' do
      sign_in
      post :create, {article: {title: 'sample', content: 'sample'} }
      expect(Article.count).to eq 1
    end

    it 'creates article with tags' do
      sign_in
      tags = create_list(:tag, 2)
      post :create, {article: {title: 'sample', content: 'sample', tag_ids: tags.pluck(:id)} }
      expect(Article.last.tags.count).to eq 2
    end  
  end

  describe 'GET #get_sub_tags' do
    it 'returns sub tags for a tag' do
      tag = create(:tag)
      sub_tag = create_list(:tag, 2, parent_id: tag.id) 
      sign_in
      get :get_sub_tags, {tag: tag.id }
      expect(JSON.parse(response.body).count).to eq 2
    end
  end

 
end
