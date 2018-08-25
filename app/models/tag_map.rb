class TagMap < ActiveRecord::Base
  belongs_to :prototype
  belongs_to :tag
end
