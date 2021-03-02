class Review < ApplicationRecord
  belongs_to :user
  belongs_to :business

  validates :rating, presence: true
  validates :comment, presence:true, length: {maximum: 500}
  validates :user_id, :uniqueness => { :scope => :business_id,
    :message => " may only write one review per business. You can only edit or delete your existing review" }

  has_attached_file :image, styles: { medium: "500x400#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  def blank_stars
    5 - rating.to_i
  end
end
