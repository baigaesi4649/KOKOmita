class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
has_many :review, dependent: :destroy
has_many :discovery, dependent: :destroy

def self.guest
    find_or_create_by!(email: 'a@a') do |member|
      member.name = "ゲスト" 
      member.user_name = "ゲスト"
      member.password = 123456
    end
end

end
