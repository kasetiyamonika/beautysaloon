namespace :product do
  task update_quantity: :environment do
    products = Product.all
    products.each do |product|
      puts product.name
    end
  end
end
