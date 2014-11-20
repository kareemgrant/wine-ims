FactoryGirl.define do
  factory :wine do
    sequence(:name) { |n| "wine#{n}" }
    api_id "abc123"
    wine_type "wine"
    url "www.winesrus.com"
    retail_price 1
  end
end
