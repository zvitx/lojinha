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
class Product < ApplicationRecord

    validates :name, :description, presence: true
    validates :price, :quantity, presence: true, numericality: true

    def low_stock?
        return false if minimum_stock.nil?

        quantity < minimum_stock
    end
end
