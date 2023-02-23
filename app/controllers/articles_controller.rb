class ArticlesController < ApplicationController
    before_action :is_logged_in? , except: [:index, :show]
    before_action :is_same? , only: [:update ,:destroy ,:edit]

    def show
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title , :description))
        @article.user = current_user
        if @article.save
            redirect_to article_path(@article)
        else
            flash[:danger] = "Error"
            render 'new'
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title , :description))
              redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path
    end

    private
    def is_same?
        @article = Article.find(params[:id])
        if current_user != @article.user and !current_user.admin?
            redirect_to articles_path
        end
    end

end