class Restaurant < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    has_many :reviews

    validates :name, :address, :phone, :website, :image, presence: true
    
    validates :phone, format: { with: /\A\(\d{3}\) \d{3}\-\d{4}\z/,
      message: "format must match (###) ###-####" }
    
    validates :website, format: { with: /\Ahttps?:\/\/.*\z/,
      message: "must start with http:// or https://"}

    validates :address, format: { with: /\A\d+[^,]+,[^,]+, [A-Z]{2} \d{5}\z/,
      message: "must be in the format 350 Fifth Avenue, New York, NY 55012"}
end
