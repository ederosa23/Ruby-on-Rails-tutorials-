class ArticlesController < AplicationController
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    rederict_to articles_show(@article)
  end


  private  
    def article_params
      params.require(:article).permit(:title, :description)
    end
end