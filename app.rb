require 'sinatra'
require 'haml'
require 'data_mapper'

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

get '/' do
  @time = Time.now
  @title = 'Survey Form'
  haml :index
end

post '/register' do
  # do code here
  @title = 'Register Page'
  @name = params[:full_name]
  haml :register
end
