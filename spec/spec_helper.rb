require('rspec')
require('pg')
require('cuisine')
require('restaurant')

DB = PG.connect({:dbname => 'dining'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM restaurants *;")
    DB.exec("DELETE FROM cuisines *;")
  end
end
