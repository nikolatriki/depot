require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "product has attributes" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert(product.errors[:description].any?)
    assert(product.errors[:image_url].any?)
    assert(product.errors[:price].any?)
  end

  test "price must be greater then 0.00" do
    product = Product.new(title: "My Book Title", description: "ggg", image_url: "we.png")

    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  test "unique title" do
    old_product = products(:one)
    new_product = Product.new(title: old_product.title, description: "ggg", image_url: "we.png", price: 1)
    assert new_product.invalid?
  end

  test "image url format" do
    def new_product(image_url)
      Product.new(title: "My Book Title", description: "ggg", price: 1, image_url: image_url)
    end

    assert new_product("fred.gif").valid?
    assert new_product("bob.doc").invalid?
  end
end
