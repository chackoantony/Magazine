class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :validatable

  def handle
    name.present? ? name.titleize : email
  end

end
