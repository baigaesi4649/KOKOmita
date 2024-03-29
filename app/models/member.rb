class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :reviews, dependent: :destroy
has_many :discoveries, dependent: :destroy
has_many :revieweds, through: :discoveries, source: :reviews

def self.looks(search, word)
  if search == "perfect_match"
    @member = Member.where("name LIKE ? OR user_name LIKE ? ", "#{word}", "#{word}")
  elsif search == "forward_match"
    @member = Member.where("name LIKE ? OR user_name LIKE ? ", "#{word}%", "#{word}%")
  else
    @member = Member.all
  end
end

def self.guest
    find_or_create_by!(email: 'guest@guest') do |member|
      member.name = "ゲスト"
      member.user_name = "ゲスト"
      member.password = 123456
    end
end

end
