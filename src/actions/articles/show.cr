class Articles::Show < ApiAction
  action do
    article = ArticleQuery.new.find(id)
    json Articles::ShowSerializer.new(article)
  end
end
