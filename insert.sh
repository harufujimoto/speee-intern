echo "IMPORT : prefectures"
rails r ./scripts/insert/insert_prefectures.rb ./scripts/master_files/prefectures.csv
echo "IMPORT : cities"
rails r ./scripts/insert/insert_cities.rb ./scripts/master_files/cities.csv
echo "IMPORT : companies"
rails r ./scripts/insert/insert_companies.rb ./scripts/master_files/companies.csv
echo "IMPORT : stores"
rails r ./scripts/insert/insert_stores.rb ./scripts/master_files/companies.csv
echo "IMPORT : property_types"
rails r ./scripts/insert/insert_property_types.rb ./scripts/master_files/property_types.csv
echo "IMPORT : reviews"
rails r ./scripts/insert/insert_reviews.rb ./scripts/master_files/reviews.csv
echo "IMPORT FINISHED🍺"
