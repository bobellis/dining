require ('rspec')
require ('restaurant')
require ('cuisine')
require ('pg')
require ('spec_helper')

describe('Restaurant') do

  describe("#==") do
    it("is the same restaurant if it has the same description") do
      restaurant1 = Restaurant.new({:name => "Joes", :id => nil})
      restaurant2 = Restaurant.new({:name => "Joes", :id => nil})
      expect(restaurant1).to(eq(restaurant2))
    end
  end

    describe('.all') do
      it('starts off empty') do
        expect(Restaurant.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("lets you save restaurants to the database") do
        restaurant = Restaurant.new({:name => "Joes", :cuisine_id => 1})
        restaurant.save()
        expect(Restaurant.all()).to(eq([restaurant]))
      end
    end


end
