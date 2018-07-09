require 'yaml'
require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'meetup_client'
end

MeetupClient.configure do |config|
  config.api_key = ENV.fetch('MEETUP_API_KEY')
end

def run
  all_events = []
  all_comments = []

  event_page = 0
  loop do
    events = fetch_events(page: event_page)
    break if events.empty?

    all_events += events

    events.each do |event|
      puts "#{Time.at(event.fetch('time') / 1000)} - #{event.fetch('name')}"
    end

    event_page += 1
  end

  comment_page = 0
  loop do
    comments = fetch_comments(page: comment_page)
    break if comments.empty?

    comments.each do |comment|
      puts comment.fetch("comment")
    end

    all_comments += comments
    comment_page += 1
  end

  File.open('meetups.yaml', 'w') do |f|
    f.write(
      {
        'events' => all_events,
        'comments' => all_comments
      }.to_yaml
    )
  end
end

def fetch_events(page: 0, per_page: 20)
  api.events(
    format: 'json',
    group_urlname: 'vancouver-ruby',
    offset: page,
    page: per_page,
    status: 'upcoming,past',
    fields: 'photo_sample'
  ).fetch('results')
end

def fetch_comments(page: 0, per_page: 20)
  api.event_comments(
    format: 'json',
    group_id: 573925,
    offset: page,
    page: per_page
  ).fetch('results')
end

def api
  MeetupApi.new
end

run
