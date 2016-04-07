
class ArticlesController < ApplicationController
  include ArticlesHelper

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find_by(id: params[:id])
  end

  def create
    @article = Article.new(article_params)
    # @article.title = params[:article][:title]
    # @article.body = params[:article][:body]
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  def destroy
    article = Article.find_by(id: params[:id])
    flash.notice = "Article '#{article.title}' Deleted!"
    article.destroy


    redirect_to articles_path
  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update
    @article = Article.find_by(id: params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

end
