require 'rspec/core/rake_task'

namespace :spec do
  namespace :integration do
    desc "Run the code examples in spec/integration/models"
    RSpec::Core::RakeTask.new(:models) do |t|
      t.pattern = 'spec/integration/models'
    end

    desc "Run the code examples in spec/integration/requests"
    RSpec::Core::RakeTask.new(:requests) do |t|
      t.pattern = 'spec/integration/requests'
    end
  end

  namespace :unit do
    desc "Run the code examples in spec/unit/models"
    RSpec::Core::RakeTask.new(:models) do |t|
      t.pattern = 'spec/unit/models'
    end

    desc "Run the code examples in spec/unit/controllers"
    RSpec::Core::RakeTask.new(:controllers) do |t|
      t.pattern = 'spec/unit/controllers'
    end
  end
end
