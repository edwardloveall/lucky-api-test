class Article < BaseModel
  table :articles do
    field title : String
    field description : String?
  end
end
