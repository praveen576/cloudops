set :environment, 'development'

every 1.day, at: '12:00 AM' do
  rake "cloud_op:fetch_offers"
end