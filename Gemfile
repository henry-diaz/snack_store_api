source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]


# Custom gems are included below this line
# ==============================================================================

# We use devise as our authenticate solution, and for the API, we're gonna
# use a token-based authentication
# GIT: https://github.com/lynndylanhurley/devise_token_auth
gem 'devise_token_auth', '~> 0.2.0'

# Amazon S3 support to active storage files system
gem 'aws-sdk-s3', require: false

# Active Storage perform an image analysis in the attachments and require this gem
# Basically we can get width and height of the image automatically
gem 'mini_magick', '~> 4.8.0'

# Audited is an ORM that logs all changes made to the models, it can save who did
# these changes, comments and associated models related. We're gonna use it to
# log changes of products stock and prices.
gem 'audited', '~> 4.7'

# pg_search build scopes that take advantage of PostgreSQL full text search.
# Our search in this project is basic, but when you add unnacent, trigram indexes,
# etc, you get a powerful set of tools that take the juice out of your database
gem 'pg_search'

# Pagination library to use with our list of products
gem 'will_paginate', '~> 3.1.0'
