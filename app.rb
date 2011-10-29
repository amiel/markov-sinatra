require 'bundler/setup'
require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path("..", __FILE__))


require APP_ROOT.join('markov_chainer')

mc = MarkovChainer.new 2

get '/*' do
  # TODO: use params[:split] to generate texts
  # content_type :json
  mc.generate_sentence(params[:split].first)
end


post '/*' do
  # content_type :json
  if params[:splat]
    mc.add_text params[:splat].join(' ')
  end
  'thanks'
end

