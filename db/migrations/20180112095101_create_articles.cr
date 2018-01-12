class CreateArticles::V20180112095101 < LuckyMigrator::Migration::V1
  def migrate
    create :articles do
     add title : String
     add description : String?
    end
  end

  def rollback
    drop :articles
  end
end
