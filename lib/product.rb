# frozen_string_literal: true

# Product class, initialize name and price
class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
