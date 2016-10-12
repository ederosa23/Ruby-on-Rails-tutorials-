class ArticlesController < AplicationController
  def new
    @article = Article.new
  end
  
  def create
   @article = Article.new(article_params)
   if @article.save
     flash[:notice] "Article was successfuly create"
     redirect_to article_path(@article)
    else
      rendew 'new'
    end
  end
  
  def show
    @article = Article.find(params[:id])    
  end


  private  
    def article_params
      params.require(:article).permit(:title, :description)
    end
end