class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :name, :address, :email, presence: true

  enum pay_type: {
    "Check" => 0,
    "Credit card" => 1,
    "Purchase order" => 2
  }

  validates :pay_type, inclusion: pay_types.keys
  validates :routing_number, :account_number, presence: true, if: -> { pay_type == "Check" }
  validates :credit_card_number, :expiration_date, presence: true, if: -> { pay_type == "Credit card" }
  validates :po_number, presence: true, if: -> { pay_type == "Purchase order" }

  validate :must_have_line_items

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  private

  def must_have_line_items
    if line_items.empty?
      errors.add(:base, "Your order must have at least one line item.")
    end
  end

end
