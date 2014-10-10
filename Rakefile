task default: :test

desc "Start the Wangbot"
task :start do
  ruby 'lib/wangbot.rb'
end

desc "Test the Wangbot"
task :test do
  sh 'bundle exec rspec spec'
end
