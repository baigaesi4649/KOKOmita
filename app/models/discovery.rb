class Discovery < ApplicationRecord
 
 has_one_attached :image1
 has_one_attached :image2
 has_many :reviews, dependent: :destroy    
 belongs_to :member
 belongs_to :genre
 validates :title, presence: true
 validates :explanation, presence: true
 
 def self.looks(search, word)
   if search == "perfect_match"
     @discovery = Discovery.joins(:genre).where("discoveries.title LIKE? OR genres.genre_name LIKE ? ","#{word}", "#{word}")
   elsif search == "forward_match"
     @discovery = Discovery.joins(:genre).where("discoveries.title LIKE? OR genres.genre_name LIKE ? ","#{word}%", "#{word}%")
   else
     @discovery = Discovery.all
   end
 end
 
 def get_image(width,height, image)
   unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    image.variant(resize_to_limit: [width,height]).processed
 end
end
