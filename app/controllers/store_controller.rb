class StoreController < ApplicationController
  def index
    @products = Product.order(:title)

    # Playtime: Add counter to store index page
    session[:counter] ||= 0
    session[:counter] += 1
    @counter = session[:counter]
  end
end
