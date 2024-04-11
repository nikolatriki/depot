class StoreController < ApplicationController
include CurrentCart
skip_before_action :authorize
before_action :set_cart

  def index
    @products = Product.order(created_at: :asc)
  end
end
