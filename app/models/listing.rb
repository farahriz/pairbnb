class Listing < ApplicationRecord
	# include PgSearch
	# multisearchable :against => [:name, :description]

	has_many :taggings
	has_many :tags, through: :taggings

	belongs_to :user

	has_many :reservations

	mount_uploaders :avatars, AvatarUploader

	scope :listing_name, -> (listing_name) { where("name ILIKE ?" , "%#{listing_name}%")   }
    scope :descrip, -> (description) { where("description ILIKE ?", "%#{description}%" ) }
    scope :price, -> (min_price, max_price) { where("price BETWEEN ? and ?", min_price, max_price ) }

	#Helper functions to extract tags from form
	def all_tags=(names)
	  self.tags = names.titleize.split(",").map do |name|
	      Tag.where(name: name.strip).first_or_create!
	  end
	end

	def all_tags
	  self.tags.map(&:name).join(", ")
	end

	def self.tagged_with(name)
	  Tag.find_by_name!(name).listings
	end
	
end

