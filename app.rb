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

before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

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

end

post '/register' do
  @title = 'Register Page'
  @name = params[:full_name]      # this is only for test
  haml :register
end
