class Tag < ApplicationRecord
	has_many :taggings
	has_many :tags, through: :taggings
	has_many :listings, through: :taggings
end
