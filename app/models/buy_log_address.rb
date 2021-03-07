class BuyLogAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :deliver_area_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10}\z|\A\d{11}\z/ }
    validates :deliver_area_id, numericality: { other_than: 1 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    buy_log = BuyLog.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code,  deliver_area_id: deliver_area_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buy_log_id: buy_log.id)
  end

end