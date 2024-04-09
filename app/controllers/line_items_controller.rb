class LineItemsController < ApplicationController
  include CurrentCart
  skip_before_action :authorize, only: %i[create destroy increment_quantity decrement_quantity]
  before_action :set_cart, only: [:create, :destroy, :increment_quantity, :decrement_quantity]
  before_action :set_line_item, only: %i[ show edit update destroy increment_quantity decrement_quantity]

  # GET /line_items or /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1 or /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items or /line_items.json
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.turbo_stream { @current_item = @line_item } # This setting of @current_item is necessary for the Yellow Fade Technique to work in app/views/line_items/_line_item.html.erb
        format.html { redirect_to store_index_url }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1 or /line_items/1.json
  def destroy
    @line_item.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to store_index_url, notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def increment_quantity
    @line_item.quantity += 1
    @line_item.update(quantity: @line_item.quantity)

    respond_to do |format| #TODO - Refactor this to use a partial for the cart and notice
      format.turbo_stream do
        render turbo_stream:
        turbo_stream.replace('cart', partial: 'layouts/cart', locals: {cart: @cart}) +
        turbo_stream.replace('notice', partial: 'store/notice')
      end
    end
  end

  def decrement_quantity
    @line_item.quantity -= 1

    respond_to do |format|
      if @line_item.quantity > 0
        @line_item.update(quantity: @line_item.quantity)

        format.turbo_stream do #TODO - Refactor this to use a partial for the cart and notice
          render turbo_stream:
          turbo_stream.replace('cart', partial: 'layouts/cart', locals: {cart: @cart}) +
          turbo_stream.replace('notice', partial: 'store/notice')
        end
      else
        @line_item.destroy

        format.turbo_stream do #TODO - Refactor this to use a partial for the cart and notice
          render turbo_stream:
          turbo_stream.replace('cart', partial: 'layouts/cart', locals: {cart: @cart}) +
          turbo_stream.replace('notice', partial: 'store/notice', locals: {notice: 'Line item was successfully destroyed.'})
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end
