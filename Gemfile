source 'https://rubygems.org'

gem 'rails', '3.2.2'
gem "zurb-foundation"
gem "simple_form", :git => "git://github.com/jwo/simple_form.git", :branch=>"zurb_integration"
gem "haml-rails"
gem 'sqlite3'
gem 'jquery-rails'
gem "compass-rails", ">=0.12"
gem "paper_trail", '~> 2'
gem "has_tokens", "1.0.1"
gem "airbrake"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem "pg"
  gem 'therubyracer'
end

group :test do
  gem "rspec-rails", ">= 2.8.0"
  gem "shoulda-matchers"
  gem "vcr"
  gem "fakeweb"
end
