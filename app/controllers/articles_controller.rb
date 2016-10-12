class ArticlesController < AplicationController
  
  def index
    @articles = Article.all    
  end
    
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
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

  def update
    @article - Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was succeesfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private  
    def article_params
      params.require(:article).permit(:title, :description)
    end
end