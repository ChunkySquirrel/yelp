class Business < ApplicationRecord
  searchkick

  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews
  has_attached_file :image, styles: { medium: "400x600#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end
