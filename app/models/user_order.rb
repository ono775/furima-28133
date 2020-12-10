class UserOrder
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code :prefecture, :municipality, :address, :building_name, :phone_number, :order

  with_options presence: true do
    validates :user
    validates :item
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, numericality: { only_integer: true, less_than: 12 }
    validates :order
  end

  def save
    user = User.create(user: user)
    item = Item.create(item: item)
    order = Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end