require 'restaurant'
describe Restaurant do
  subject(:restaurant) {Restaurant.new}
  let (:test_order) {double :test_order}
  let(:menu) do {"diet coke"=>0.99, "foie gras"=>18.50, "caviar"=>99.00,
   "oyster"=>0.99, "champagne"=>50.00} end

  context "Method check" do
    it {is_expected.to respond_to :accept_order}
    it {is_expected.to respond_to :deliver}
  end
  describe "#accept_order" do
    it 'should accept the order' do
      allow(test_order).to receive(:user_checked_out?).with(test_order).and_return true
      allow(test_order).to receive(:order).and_return test_order
      restaurant.accept_order(test_order)
      expect(restaurant.order_accepted).to include test_order
    end
  end
  describe "#order_complete" do
    it 'removes the first order from the array' do
      allow(test_order).to receive(:user_checked_out?).with(test_order).and_return true
      allow(test_order).to receive(:order).and_return test_order
      restaurant.accept_order(test_order)
      restaurant.order_complete
      expect(restaurant.order_accepted).to_not include test_order
    end
  end
end