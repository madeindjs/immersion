class Product < ApplicationRecord
  extend FriendlyId

  belongs_to :user
  belongs_to :category

  validates :name, presence: true, length: {minimum: 2}
  validates :price, presence: true
  validates_associated :category
  validates_associated :user

  mount_uploader :picture, PictureUploader
  friendly_id :name, use: :slugged

  def self.from_params params
    conditions = {}

    # conditions[:name] = params[:name] if params[:name] and !params[:name].empty?
    conditions[:country] = params[:country] if params[:country] and !params[:country].empty?
    conditions[:category_id] = params[:category_id] if params[:category_id] and !params[:category_id].empty?

    return Product.where conditions
  end

end
