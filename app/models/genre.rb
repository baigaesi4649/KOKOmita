class Genre < ApplicationRecord
    
has_many :discovery, dependent: :destroy

end
