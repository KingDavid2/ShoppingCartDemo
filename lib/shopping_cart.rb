# frozen_string_literal: true

# ShoppingCart class, holds and manage the user products
class ShoppingCart
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_products(*products)
    @products.append(*products)
  end

  def total_price
    @products.map(&:price).inject(:+).round(2)
  end
end
