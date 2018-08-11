class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :captured_images, dependent: :destroy

  accepts_nested_attributes_for :captured_images, reject_if: :reject_sub_images
  #accepts_nested_attributes_for :captured_images, allow_destroy: true

  validates :title,
            :catch_copy,
            :concept,
            presence: true

  

  def reject_sub_images(attributed)
    attributed['content'].blank?
  end

  

  # def set_main_thumbnail
  #   captured_images.where(status: 0).content
  # end

  def set_main_thumbnail
    captured_images.main.first.content
  end

  # def main_image
  #   captured_images.find_by(status: 0)
  # end

  # def set_main_thumbnail
  #   captured_images.main.first.content.to_s
  # end

  # def main_image
  #   captured_images.find_by(status: 1)
  # end

  # def sub_images
  #   captured_images.find_by(status: 0)
  # end



  def posted_date
    created_at.strftime('%b %d %a')
  end
end
