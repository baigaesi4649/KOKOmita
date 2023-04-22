class Discovery < ApplicationRecord
 
 has_one_attached :image1
 has_one_attached :image2
 has_many :review, dependent: :destroy    
 belongs_to :member
 belongs_to :genre
 
 def get_image(width,height, image)
  unless image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
    image.variant(resize_to_limit: [width,height]).processed
 end
end
