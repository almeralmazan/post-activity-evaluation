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
  p                   = Person.new
  p.pangalan          = params[:pangalan]
  p.edad              = params[:edad]
  p.kasarian          = params[:kasarian]
  p.trabaho           = params[:trabaho]
  p.tirahan           = params[:tirahan]
  p.benipisyaryo      = params[:benipisyaryo]
  p.unang_sagot       = params[:unang_sagot]
  p.pangalawang_sagot = params[:pangalawang_sagot]
  p.pangatlong_sagot  = params[:pangatlong_sagot]
  p.pangapat_sagot    = params[:pangapat_sagot]
  p.created_at        = Time.now
  p.updated_at        = Time.now

  if p.save
    redirect '/new'
  else
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
