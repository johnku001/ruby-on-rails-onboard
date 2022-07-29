if ENV['REDIS_CACHE_URL']
  $redis = Redis.new(url: ENV['REDIS_CACHE_URL'])
else
  $redis = Redis.new
end