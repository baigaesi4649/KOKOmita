class Discovery < ApplicationRecord
 
 has_one_attached :image1
 has_one_attached :image2
 has_many :review, dependent: :destroy    
 belongs_to :member
 belongs_to :genre
 
end
