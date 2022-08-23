rails r ./scripts/insert/insert_prefectures.rb ./scripts/master_files/prefectures.csv
echo "prefectures ok"
rails r ./scripts/insert/insert_cities.rb ./scripts/master_files/cities.csv
echo "cities ok"
rails r ./scripts/insert/insert_companies.rb ./scripts/master_files/companies.csv
echo "companies ok"
rails r ./scripts/insert/insert_stores.rb ./scripts/master_files/companies.csv
echo "stores ok"
rails r ./scripts/insert/insert_property_types.rb ./scripts/master_files/property_types.csv
echo "property_types ok"
rails r ./scripts/insert/insert_reviews.rb ./scripts/master_files/reviews.csv
echo "reviews ok"
