require 'sinatra'

class App < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    '<h2>Welcome!</h2>'
  end

  get '/hello' do
    '<h2>Hello <em>World</em>!</h2>'
  end

  get '/potato' do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get '/dice' do
    die_roll1 = rand(1..6)
    die_roll2 = rand(1..6)

    { die1: die_roll1 }.to_json + { die2: die_roll2 }.to_json
  end

  get '/add/1/2' do
    sum = 1 + 2
    { result: sum }.to_json
  end

  # OR
  #perams hash
  get '/add/:num1/:num2' do
    num1 = params[:num1].to_i
    num2 = params[:num2].to_i

    sum = num1 + num2
    { result: sum }.to_json
  end

end

run App
