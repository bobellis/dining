require ('rspec')
require ('restaurant')
require ('cuisine')
require ('pg')
require ('spec_helper')

describe('Restaurant') do

    describe('.all') do
      it('starts off empty') do
        expect(Restaurant.all()).to(eq([]))
      end
    end
  
  end
