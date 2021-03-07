class Item < ApplicationRecord
  belongs_to :user
  has_one :buy_log
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :deliver_fee
  belongs_to :deliver_area
  belongs_to :deliver_date

  with_options presence: true do
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :deliver_fee_id
      validates :deliver_area_id
      validates :deliver_date_id
    end
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :image
  end
end
