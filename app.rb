require 'sinatra'
require 'haml'
require 'data_mapper'
require File.expand_path('../model.rb', __FILE__)

get '/' do
  @time = Time.now
  @title = 'Survey Form'
  haml :index
end

# new record page
get '/new' do
  @time = Time.now
  @title = 'Create new record'
  haml :new
end 

# create record
post '/create' do
  p               = Person.new
  p.name          = params[:full_name]
  p.age           = params[:age]
  p.sex           = params[:sex]
  p.work          = params[:work]
  p.address       = params[:address]
  p.benefit       = params[:benefits]
  p.first_answer  = params[:first_answer]
  p.second_answer = params[:second_answer]
  p.third_answer  = params[:third_answer]
  p.fourth_answer = params[:fourth_answer]
  p.created_at    = Time.now

  if p.save
    status 201
    redirect '/success'
  else
    status 412
    redirect '/failed'
  end
end

# list all person
get '/list' do
  @persons = Person.all
  haml :list
end

# get '/success' do
#   @title = "Success Page"
#   erb :success
# end
# 
# get '/failed' do
#   @title = "Failed Page"
#   erb :failed
# end
