source 'http://rubygems.org'

gem 'rails', '3.0.9'

group :development do
  # To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
  # gem 'ruby-debug'
  gem 'ruby-debug19'
  gem 'railroady'
  #gem 'mysql2', "< 0.3.0"
  gem "sqlite3"
end

group :production do
  gem 'unicorn'
  gem 'smurf' # minify css and javascript
end

gem "haml"
gem "sass"
gem "authlogic"
gem "rails_config"
gem "jquery-rails"
gem "friendly_id", "~> 3.2"
gem "kaminari" # pagination
gem "carrierwave", :git => 'git://github.com/jnicklas/carrierwave.git', :branch => 'master'

# test stuff
group :test do
  gem "shoulda"
  gem 'factory_girl_rails', "1.1.beta1"
  gem "rspec-rails", "2.0.0.beta.12"
  gem 'simplecov', '>=0.3.8', :require => false
end
