class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    has_one_attached :profile_image
    has_many :posts, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    def get_profile_image(width, height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/22598410.jpg')
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
      profile_image.variant(resize_to_limit: [width, height]).processed
    end
    
    # ゲストログインのための記述
    def self.guest
      find_or_create_by!(email: 'guest@example.com') do |customer|
        customer.password = SecureRandom.urlsafe_base64
        customer.name = 'guest'
        customer.gender = '男性'
        customer.height = '170'
        customer.weight = '63'
      end
    end

end
