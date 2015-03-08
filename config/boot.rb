ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

ENV['DEV_URL'] = '0.0.0.0:3000'
ENV['PROD_URL'] = 'http://rocky-anchorage-3250.herokuapp.com/'
