class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @products = Product.all
  end

  def show; end

  def edit; end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Produto criado com sucesso!"

    else
      render :new, status: :unprocessable_entity, notice: "Não foi possivel criar o produto"
    end
  end

  def update
    if @product.update(product_params)
    redirect_to products_path, notice: "Produto atualizado com sucesso"

    else
      render :edit, status: :unprocessable_entity, notice: "Não foi possivel atualizar o produto"
    end
  end

  def destroy
    @product.destroy!

    redirect_to products_path, notice: "Produto removido com sucesso!"
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :quantity, :minimum_stock)
  end
end
