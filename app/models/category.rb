class Category < ApplicationRecord
  has_many :products

  mount_uploader :picture, PictureUploader

  extend FriendlyId
  friendly_id :name, use: :slugged


  def color
    case self.name
    when 'Repas'
      'primary'
    when 'Musique'
      'danger'
    when 'Art'
      'warning'
    end
  end
end
