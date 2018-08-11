class CapturedImage < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :content, PrototypeImageUploader

  enum status: { main: 0, sub: 1 }

  validates :content,
            :status,
            presence: true
end
