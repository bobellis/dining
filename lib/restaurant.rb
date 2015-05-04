class Restaurant

  attr_reader(:name, :cuisine_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @cuisine_id = attributes.fetch(:cuisine_id)
  end

  define_singleton_method(:all) do
    returned_restaurants = DB.exec('SELECT * FROM restaurants;')
    restaurants = []
    returned_restaurants.each() do |restaurant|
      name = restaurant.fetch('restaurant_name')
      cuisine_id = restaurant.fetch('cuisine_id')
      restaurants.push(Restaurant.new({:name => name, :cuisine_id => cuisine_id}))
    end
    restaurants
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO restaurants (restaurant_name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_restaurant|
    self.name().==(another_restaurant.name())
  end

end
