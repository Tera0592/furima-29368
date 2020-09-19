class Item < ApplicationRecord
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :category
  belongs_to_active_hash :fee
  belongs_to_active_hash :place
  belongs_to_active_hash :day

  validates :name, :introduction, :condition, :category, :fee, :place, :day,  presence: true
  validates :price, format: { with: /\A[0-9]+\z/i }
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :condition_id, numericality: { other_than: 1 } 
  validates :category_id,  numericality: { other_than: 1 } 
  validates :fee_id,       numericality: { other_than: 1 } 
  validates :place_id,     numericality: { other_than: 1 } 
  validates :day_id,       numericality: { other_than: 1 } 
end
