class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :prototype, counter_cache: :like_count
end
