class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_fee
  belongs_to_active_hash :region
  belongs_to_active_hash :ship_date

  validates :title, :image, :description, :price, :category, :condition, :ship_fee, :region, :ship_date, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :ship_fee_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :ship_date_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' }
end
