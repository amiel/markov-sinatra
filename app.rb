require 'bundler/setup'
require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path("..", __FILE__))
# require APP_ROOT.join('app/models')

get '/' do
  content_type :json

end


