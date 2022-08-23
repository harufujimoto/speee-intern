echo "IMPORT : prefectures"
rails r ./scripts/insert/insert_prefectures.rb ./scripts/small_input/prefectures.csv
echo "IMPORT : cities"
rails r ./scripts/insert/insert_cities.rb ./scripts/small_input/cities.csv
echo "IMPORT : companies"
rails r ./scripts/insert/insert_companies.rb ./scripts/small_input/companies.csv
echo "IMPORT : stores"
rails r ./scripts/insert/insert_stores.rb ./scripts/small_input/companies.csv
echo "IMPORT : property_types"
rails r ./scripts/insert/insert_property_types.rb ./scripts/small_input/property_types.csv
echo "IMPORT : reviews"
rails r ./scripts/insert/insert_reviews.rb ./scripts/small_input/reviews.csv
echo "INSERT FINISHED🍺"
