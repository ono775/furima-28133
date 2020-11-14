class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id
    validates :shipping_charges_id
    validates :shipping_area_id
    validates :shipping_date_id
    validates :price
    validates :user_id
  end
end
