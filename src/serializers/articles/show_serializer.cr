class Articles::ShowSerializer < Lucky::Serializer
  def initialize(@article : Article)
  end

  def render
    {
      title: @article.title,
      description: @article.description
    }
  end
end
