source 'https://rubygems.org'

require 'json'
require 'open-uri'

versions = JSON.parse(::URI.open('https://pages.github.com/versions.json').read)
# gem 'github-pages', group: :jekyll_plugins


gem 'github-pages', versions['github-pages']
gem 'webrick', '~> 1.8'
