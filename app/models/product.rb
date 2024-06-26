class Product < ApplicationRecord
  extend Mobility
  translates :title, type: :string
  translates :description, type: :text

  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true, length: {minimum: 5, message: "must be at least 5 characters long."}
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: "must be a URL for GIF, JPG, or PNG image."
  }

  private

  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line Items present, can not delete!")
      throw :abort
    end
  end
end
