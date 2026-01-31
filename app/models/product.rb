# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  name        :string           not null
#  price       :decimal(, )      not null
#  quantity    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord

    validates :name, :description, presence: true
    validates :price, :quantity, presence: true, numericality: true

end
