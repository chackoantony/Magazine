require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'validates email' do
    expect(User.new().valid?).to eq false
  end

  it 'validates password' do
    expect(User.new(email: 'some@gmail.com').valid?).to eq false
  end  
end
