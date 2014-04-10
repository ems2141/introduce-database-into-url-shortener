ENV['RACK_ENV'] = 'test'
require 'sequel'

DB = Sequel.connect('postgres://gschool_user:password@localhost/url_shortener_test')

RSpec.configure do |config|
  config.order = 'random'
end

def id_of_created_url(current_path)
  current_path.gsub('/','')
end