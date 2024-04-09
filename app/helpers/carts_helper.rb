module CartsHelper
  def disable_checkout_button?
    (request.referer == new_order_url) || current_page?(new_order_path)
  end
end
