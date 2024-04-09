module CartsHelper
  def disable_checkout_button?
    (request.referer == new_order_url unless current_page?(store_index_path)) || current_page?(new_order_path)
  end
end
