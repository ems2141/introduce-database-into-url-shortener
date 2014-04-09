require 'sequel'

database_url = if !ENV['HEROKU_POSTGRESQL_TEAL_URL'].nil?
                 ENV['HEROKU_POSTGRESQL_TEAL_URL']
               elsif !ENV['HEROKU_POSTGRESQL_AQUA_URL'].nil?
                 ENV['HEROKU_POSTGRESQL_AQUA_URL']
               else
                 'postgres://gschool_user:password@localhost/url_shortener_development'
               end

DB = Sequel.connect(database_url)

require './url_shortener'

run UrlShortener