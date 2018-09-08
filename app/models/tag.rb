class Tag < ActiveRecord::Base
  has_many :tag_maps, dependent: :destroy
  has_many :prototypes, through: :tag_maps
end
