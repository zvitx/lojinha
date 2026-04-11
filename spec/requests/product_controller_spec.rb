require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "#show" do
    subject(:request) { get "/products/#{product.id}" }

    let!(:product) { create(:product) }

    it "returns ok status" do
      request
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do 
    subject(:request) { post "/products", params: params }

    let(:params) do
      { product: {
        name: "Produto",
        price: 10,
        description: "Sou um produto legal",
        quantity: 20,
        minimum_stock: nil
      } }
    end

    it "returns found" do
      request
      expect(response).to have_http_status(:found)
    end

    it "creates a new product" do
      expect { request }.to change(Product, :count).by(1)
    end

    context "when params are invalid" do 
      let(:params) do
      { product: {
        name: nil,
      } }
      end
      
      it "does not create the product" do 
        expect { request }.not_to change(Product, :count)
      end

      it "returns unprocessable_content" do
        request
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "#update" do
    subject(:request) { patch "/products/#{product.id}", params: params }

    let!(:product) { create(:product) }

    let(:params) do
      { product: {
        name: "Novo nome de produto",
      } }
    end
    
    it "returns found" do
      request
      expect(response).to have_http_status(:found)
    end

    it "updates the product name" do
      request
      expect(product.reload.name).to eq("Novo nome de produto")
    end

    context "when params are invalid" do 
      let(:params) do
      { product: {
        name: nil,
      } }
      end
      
      it "does not update" do 
        expect { request }.not_to change { product.reload.name }
      end

      it "returns unprocessable_content" do
        request
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "#destroy" do
    subject(:request) { delete "/products/#{product.id}" }

    let!(:product) { create(:product) }

    it "deletes the product" do
      expect { request }.to change(Product, :count).by(-1)
    end
  end
end
