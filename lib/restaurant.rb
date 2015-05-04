class Restaurant

  attr_reader(:name, :cuisine_id)

  define_method(:initialize) do |name, cuisine_id|
    @name = attributes.fetch(:name)
    @cuisine_id = attributes.fetch(:cuisine_id)
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec('SELECT * FROM restaurants;')
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch('restaurant_name')
      restaurants.push(Restaurant.new({:name => name}))
    end
    restaurants

  end
end
