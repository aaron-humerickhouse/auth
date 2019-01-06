require 'database_cleaner'

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    console.log "Preserving database State"
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    console.log "Database returned to preserved state"
  end
end
