# frozen_string_literal: true

source 'https://rubygems.org'

gem 'jekyll'

gem 'rubocop-jekyll'

# Required to fix Ruby standard library load warnings
gem 'base64'
gem 'benchmark'
gem 'bigdecimal'
gem 'csv'
gem 'logger'
gem 'ostruct'
gem 'rubocop'

group :jekyll_plugins do
  gem 'jekyll-seo-tag'
  gem 'jekyll-sitemap'
end

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem 'tzinfo', '>= 1', '< 3'
  gem 'tzinfo-data'
end
