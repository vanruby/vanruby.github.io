# frozen_string_literal: true

source "https://rubygems.org"

gem "jekyll"

gem "rubocop-jekyll"

# Required to fix Ruby standard library load warnings
gem "base64"
gem "benchmark"
gem "csv"
gem "logger"
gem "ostruct"
gem "bigdecimal"

group :jekyll_plugins do
  # Install Jekyll plugins here
end

platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end
