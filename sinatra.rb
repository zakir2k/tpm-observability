require 'sinatra'
require 'datadog/statsd'

# Create a DogStatsD client instance.
statsd = Datadog::Statsd.new('localhost', 8125)

#routes
get '/hello-world' do
  'Hello Beautiful Tech Programs Folk. We are in business!'
end

#calculate the multiplacation of two numbers
get '/multiply/:number1/:number2' do
  var1 = params['number1'].to_i * params['number2'].to_i
  statsd.increment('multiplication.increment', tags: ['environment:dev','function:multiply'])
  "Numbers Multiplied together is calculated as: #{var1}"
end

#calculate the addition of two numbers
get '/add/:number1/:number2' do
  var1 = params['number1'].to_i + params['number2'].to_i
  statsd.increment('addition.increment', tags: ['environment:dev','function:add'])
  "Numbers Added together is calculated as: #{var1}"
end
