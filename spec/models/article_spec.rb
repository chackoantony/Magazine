require 'rails_helper'

RSpec.describe Article, type: :model do
  
  it 'validates title' do 
    expect(Article.new(title: nil).valid?).to eq false
  end

  it 'validates content' do 
    expect(Article.new(title: 'title', content: nil).valid?).to eq false
  end

end
