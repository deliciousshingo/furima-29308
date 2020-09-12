class OrderShipment

  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :city, :house_number, :building, :phone_number, :item_id, :user_id, :token
  
  with_options presence: true do
    validates :item_id
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is invalid. Input full-width characters.' }
    validates :house_number
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A0[7-9]0-?\d{4}-?\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipment.create(postal: postal, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end