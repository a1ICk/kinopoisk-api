# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', require: false
gem 'faker'
gem 'pg', '~> 1.4', '>= 1.4.5'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4'

group :development, :test do
  gem 'pry-byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'

  gem 'rubocop', require: false

  gem 'rubocop-performance', require: false

  gem 'rubocop-rails', require: false

  gem 'rubocop-rspec', require: false
end

group :development do
end

gem 'ruby-lsp', '~> 0.3.8', group: :development
