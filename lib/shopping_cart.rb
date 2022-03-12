# frozen_string_literal: true

# ShoppingCart class, holds and manage the user products
class ShoppingCart
  attr_accessor :products
  attr_accessor :tax_rate

  def initialize(tax_rate: 0.125)
    @products = []
    @tax_rate = tax_rate
  end

  def add_products(*products)
    @products.append(*products)
  end

  def total_price
    @products.map(&:price).inject(:+).round(2)
  end

  def tax_amount
    (total_price * @tax_rate).round(2)
  end

  def total_price_with_tax
    (total_price + tax_amount).round(2)
  end
end
