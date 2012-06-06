DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/pae.db")

class Person

  include DataMapper::Resource

  property :id                , Serial
  property :pangalan          , String
  property :edad              , String
  property :kasarian          , String
  property :trabaho           , String
  property :tirahan           , Text
  property :benipisyaryo      , String
  property :unang_sagot       , Text
  property :pangalawang_sagot , Text
  property :pangatlong_sagot  , Text
  property :pangapat_sagot    , Text
  property :created_at        , DateTime
  property :updated_at        , DateTime

end

# Create or upgrade all tables at once, like magic
DataMapper.auto_upgrade!
