require 'bundler/setup'
require 'sinatra'

APP_ROOT = Pathname.new(File.expand_path("..", __FILE__))


require APP_ROOT.join('markov_chainer')

mc = MarkovChainer.new 2

helpers do
  def path_as_words
    params[:splat].join.split('/')
  end
end

get '/*' do
  # content_type :json
  if (word = path_as_words.first) && 0 < word.size
    mc.generate_sentence word
  else
    mc.generate_sentence
  end
end


post '/*' do
  # content_type :json
  if 0 < path_as_words.size
    text = path_as_words.join(' ')
    mc.add_text text
    'thanks'
  else
    "thanks for nothin'"
  end
end

