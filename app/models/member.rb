class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
has_many :reviews, dependent: :destroy
has_many :discoveries, dependent: :destroy

def self.looks(search, word)
  if search == "perfect_match"
    @member = Member.where("name LIKE?", "#{word}")
  elsif search == "forward_match"
    @member = Member.where("name LIKE?","#{word}%")
  elsif search == "backward_match"
    @member = Member.where("name LIKE?","%#{word}")
  elsif search == "partial_match"
    @member = Member.where("name LIKE?","%#{word}%")
  else
    @member = Member.all
  end
end
  
def self.guest
    find_or_create_by!(email: 'a@a') do |member|
      member.name = "ゲスト" 
      member.user_name = "ゲスト"
      member.password = 123456
    end
end

end
