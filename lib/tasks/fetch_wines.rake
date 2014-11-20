desc 'Fetching wines from Wine.com API'

task :query_api => :environment do
  if Rails.env == 'development'

    [1, 51, 101, 151].each do |offset|
      results = WineApi.new(50, offset).fetch_wines
      WineArchiver.store(results)
    end

    puts "API Pull Complete, #{Wine.count} products saved to Wine IMS"
  end
end

task :fetch_wine_data => [:query_api]
