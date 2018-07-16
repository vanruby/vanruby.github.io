#!/usr/bin/env ruby
#

require 'yaml'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'virtus'
end

class Comment
  include Virtus.model

  attribute :event_id
  attribute :comment
end

class Meetup
  include Virtus.model

  attribute :id, String
  attribute :name, String
  attribute :description, String
  attribute :event_url, String
  attribute :time, Integer

  def comments
    COMMENTS.select { |c| c.event_id == id }
  end

  def date
    Time.at(time / 1000).to_date
  end

  SLIDE_DOMAINS = %w(speakerdeck slideshare gist)
  VIDEO_DOMAINS = %w(youtube youtu.be)

  def slides
    find_urls(SLIDE_DOMAINS)
  end

  def videos
    find_urls(VIDEO_DOMAINS)
  end

  def find_urls(domains)
    urls.select { |url| domains.any? { |d| url[d] } }.uniq
  end

  def urls
    @urls ||= begin
      all_content = (description || "") + comments.map(&:comment).join(" ")
      URI.extract(all_content)
    end
  end
end


MEETUPS = YAML.load(File.read("meetups.yaml")).fetch("events").map { |h| Meetup.new(h) }
COMMENTS = YAML.load(File.read("meetups.yaml")).fetch("comments").map { |h| Comment.new(h) }

meetups = MEETUPS
  .map { |data| Meetup.new(data) }
  .reject { |meetup| meetup.name["Developer Night"] }
  .reject { |meetup| meetup.name["Hack Night"] }
  .map { |meetup|
    { name: meetup.name,
      url: meetup.event_url,
      date: meetup.date,
      slides: meetup.slides,
      videos: meetup.videos,
    }
}

File.open("clean_meetups.yml", "w") { |f| f.write meetups.to_yaml }
