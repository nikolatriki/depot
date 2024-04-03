class StoreController < ApplicationController
include CurrentCart
before_action :set_cart

  def index
    @products = Product.order(created_at: :desc)
  end
end
