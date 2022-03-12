require_relative '../lib/product'
require_relative '../lib/shopping_cart'

describe ShoppingCart do
  let(:product) { Product.new('Dove Soap', 39.99) }
  let(:cart) { ShoppingCart.new }

  describe 'Add products to the shopping cart' do
    before do
      5.times { cart.add_products(product) }
    end

    it 'The shopping cart should contain 5 Dove Soaps each with a unit price of 39.99' do
      product_names = cart.products.select { |product|  product.name == 'Dove Soap' }
      product_prices = cart.products.select { |product|  product.price == 39.99 }

      expect(product_names.count).to eq(5)
      expect(product_prices.count).to eq(5)
    end

    it 'The shopping cart\'s total price should equal 199.95' do
      expect(cart.total_price).to eq(199.95)
    end
  end
end
