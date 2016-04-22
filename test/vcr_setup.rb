require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :faraday
  c.allow_http_connections_when_no_cassette = true
  c.default_cassette_options = {
      record: :new_episodes
  }
end
