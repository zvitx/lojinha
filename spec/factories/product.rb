FactoryBot.define do
    factory :product do
        name { "Produto" }
        price { 10 }
        description { "Sou um produto da factory" }
        quantity { 20 }
        minimum_stock { 5 }

        trait :low_stock do
            quantity { 1 }
        end
    end
end