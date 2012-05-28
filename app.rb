require 'sinatra'
require 'haml'
require 'data_mapper'

# ================= DATABASE and TABLE setup ===================
DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/pae.db")

class Person

  include DataMapper::Resource

  property :id,             Serial
  property :name,           String
  property :age,            String
  property :sex,            String
  property :work,           String
  property :address,        Text
  property :benefit,        String
  property :first_answer,   Text
  property :second_answer,  Text
  property :third_answer,   Text
  property :fourth_answer,  Text
  property :created_at,     DateTime
  property :updated_at,     DateTime

end

# Create or upgrade all tables at once, like magic
DataMapper.auto_upgrade!
# ============== end DATABASE and TABLE setup ===================

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
  p = Person.new
  p.name = params[:full_name]
  p.age = params[:age]
  p.sex = params[:sex]
  p.work = params[:work]
  p.address = params[:address]
  p.benefit = params[:benefits]
  p.first_answer = params[:first_answer]
  p.second_answer = params[:second_answer]
  p.third_answer = params[:third_answer]
  p.fourth_answer = params[:fourth_answer]
  p.created_at = Time.now

  if p.save
    status 201
    redirect '/success'
  else
    status 412
    redirect '/failed'
  end
end

get '/success' do
  erb :success
end

get '/failed' do
  erb :failed
end

# list
post '/test' do
  @name = params[:full_name]
  @age = params[:age]
  @sex = params[:sex] 
  @work = params[:work] 
  @address = params[:address] 
  @benefit = params[:benefits] 
  @first_answer = params[:first_answer] 
  @second_answer = params[:second_answer] 
  @third_answer = params[:third_answer] 
  @fourth_answer = params[:fourth_answer] 
  @created_at = Time.now
  erb :test
end
