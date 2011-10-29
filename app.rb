require 'bundler/setup'
require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path("..", __FILE__))


require APP_ROOT.join('markov_chainer')

mc = MarkovChainer.new 2

get '/' do
  # content_type :json
  mc.generate_sentence
end


post '/' do
  # content_type :json
  if params[:words]
    mc.add_text params[:words]
  end
  'thanks'
end

