# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  description   :string           not null
#  minimum_stock :integer
#  name          :string           not null
#  price         :decimal(, )      not null
#  quantity      :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
  end

  describe "#low_stock?" do
    let(:product) do 
      Product.new(
      name: "Produto",
      price: 3.99,
      quantity: 5,
      minimum_stock: 10,
      description: "Sou um produto"
    )
    end

    context "when product has low stock" do
      it "returns true" do
          expect(product.low_stock?).to be(true)
      end
    end

    context "when product has no low stock" do

      before { product.update(quantity: 10) }
      
      it "returns false" do
        expect(product.low_stock?).to be(false)
      end
    end

    context "when minimum_stock is nil" do

      before { product.update(minimum_stock: nil) }

      it "returns false" do
        expect(product.low_stock?).to be(false)
      end
    end
  end
end
