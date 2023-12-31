class Post < ApplicationRecord
      has_one_attached :image
      belongs_to :customer
      has_many :post_comments, dependent: :destroy
      has_many :favorites, dependent: :destroy
      has_many :tags, dependent: :destroy
      
      validates :text, presence: true
      validates :image, presence: true
      
      def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/1560031.jpg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
         image
      end
      
      def favorited_by?(customer)
          favorites.exists?(customer_id: customer.id)
      end

end
