class AdminController < ApplicationController
  def index
    @orders = Order.count
  end
end
