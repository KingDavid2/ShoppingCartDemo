require_relative '../lib/product'
require_relative '../lib/shopping_cart'

describe ShoppingCart do
  let(:product1) { Product.new('Dove Soap', 39.99) }
  let(:product2) { Product.new('Axe Deo', 99.99) }
  let(:tax_rate) { 0.125 }
  let(:cart) { ShoppingCart.new(tax_rate: tax_rate) }

  describe 'Add products to the shopping cart' do
    before do
      5.times { cart.add_products(product1) }
    end

    it 'The shopping cart should contain 5 Dove Soaps each with a unit price of 39.99' do
      product_names = cart.products.select { |product1|  product1.name == 'Dove Soap' }
      product_prices = cart.products.select { |product1|  product1.price == 39.99 }

      expect(product_names.count).to eq(5)
      expect(product_prices.count).to eq(5)
    end

    it 'The shopping cart\'s total price should equal 199.95' do
      expect(cart.total_price).to eq(199.95)
    end
  end

  describe 'Add additional products of the same type to the shopping cart' do
    before do
      5.times { cart.add_products(product1) }
      3.times { cart.add_products(product1) }
    end

    it 'The shopping cart should contain 8 Dove Soaps each with a unit price of 39.99' do
      product_names = cart.products.select { |product1|  product1.name == 'Dove Soap' }
      product_prices = cart.products.select { |product1|  product1.price == 39.99 }

      expect(product_names.count).to eq(8)
      expect(product_prices.count).to eq(8)
    end

    it 'The shopping cart\'s total price should equal 319.92' do
      expect(cart.total_price).to eq(319.92)
    end
  end

  describe 'Calculate the tax rate of the shopping cart with multiple items' do
    before do
      2.times { cart.add_products(product1) }
      2.times { cart.add_products(product2) }
    end

    it 'The shopping cart should contain 2 Dove Soaps each with a unit price of 39.99' do
      product_names = cart.products.select { |product1|  product1.name == 'Dove Soap' }
      product_prices = cart.products.select { |product1|  product1.price == 39.99 }

      expect(product_names.count).to eq(2)
      expect(product_prices.count).to eq(2)
    end

    it 'The shopping cart should contain 2 Axe Deos each with a unit price of 99.99' do
      product2_names = cart.products.select { |product1|  product1.name == 'Axe Deo' }
      product2_prices = cart.products.select { |product1|  product1.price == 99.99 }

      expect(product2_names.count).to eq(2)
      expect(product2_prices.count).to eq(2)
    end

    it 'And the total sales tax amount for the shopping cart should equal 35.00' do
      expect(cart.tax_amount).to eq(35.00)
    end

    it 'The shopping cart\'s total price should equal 319.92' do
      expect(cart.total_price_with_tax).to eq(314.96)
    end
  end
end
