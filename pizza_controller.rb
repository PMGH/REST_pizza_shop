require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza')

get '/pizzas' do
  # get all the pizzas
  @pizzas = Pizza.all()
  # display from index.erb
  erb( :index )
end

# most specific routes first. This get will be triggered before '/pizzas/:id'
get '/pizzas/new' do
  # display from new.erb
  erb( :new )
end

get '/pizzas/:id/edit' do
  # find pizza order details
  @pizza = Pizza.find(params['id'])
  # display from edit.erb
  erb( :edit )
end

get '/pizzas/:id' do
  # find pizza order details by passing the id in from the url
  @pizza = Pizza.find(params['id'])
  # display from show.erb
  erb( :show )
end


post '/pizzas' do
  # set @pizza equal to the a new Pizza instance using the parameters from the url
  @pizza = Pizza.new(params)
  # save the new Pizza instance
  @pizza.save()
  # display from create.erb
  erb( :create )
end

post '/pizzas/:id/delete' do
  # find the pizza to be deleted by it's id
  pizza = Pizza.find(params['id'])
  # delete the found pizza
  pizza.delete()
  # display from delete.erb
  erb( :delete )
end

post '/pizzas/:id' do
  # create new instance pizza
  @pizza = Pizza.new(params)
  # update order details
  @pizza.update()
  # display from update.erb
  erb( :update )
end
