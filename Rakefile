require "rake"
require "rake/testtask"

Rake::TestTask.new do
  Dir.glob('./test/**/*_test.rb') { |file| require file}
end

task default: :test
