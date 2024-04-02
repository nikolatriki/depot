class CartsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  before_action :set_cart, only: %i[show edit update destroy]

  # GET /carts or /carts.json
  def index
    @carts = Cart.where(id: session[:cart_id])
  end

  # GET /carts/1 or /carts/1.json
  def show

  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully created." }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to cart_url(@cart), notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    if @cart.id == session[:cart_id]
      @cart.destroy
      session[:cart_id] = nil

      respond_to do |format|
        format.html { redirect_to store_index_url, notice: "Your cart is currently empty." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to carts_url, notice: "You can only delete your own cart." }
      end
    end

  end

  private

  # Playtime: Implement the set_cart method to ensure that the user can only view their own cart.
  def set_cart
    @cart = Cart.find(params[:id])
    if params[:id].to_i != session[:cart_id]
      flash[:notice] = "You can only view your own cart."
      redirect_to carts_url
    end
  end

  # Only allow a list of trusted parameters through.
  def cart_params
    params.fetch(:cart, {})
  end

  def invalid_cart
    logger.error("Attempt to access invalid cart #{params[:id]}")
    redirect_to store_index_path, notice: "Invalid cart"
  end
end
