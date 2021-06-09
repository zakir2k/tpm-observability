require 'sinatra'

#routes
get '/hello-world' do
  'Hello Beautiful Tech Programs Folk. We are in business!'
end

#calculate the multiplacation of two numbers
get '/v1/multiply/:number1/:number2' do
  var1 = params['number1'].to_i * params['number2'].to_i
  "Numbers Multiplied together is calculated as: #{var1}"
end

#calculate the addition of two numbers
get '/v1/add/:number1/:number2' do
  var1 = params['number1'].to_i + params['number2'].to_i
  "Numbers Added together is calculated as: #{var1}"
end