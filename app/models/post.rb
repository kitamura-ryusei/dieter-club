class Post < ApplicationRecord
      has_one_attached :image
      belongs_to :customer
      
      def get_image
            if image.attached?
                  image
            else
                  '1560031.jpg'
            end
      end
end
