class CommentsController < ApplicationController
  
  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end
  
  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(article), notice: 'コメントを投稿しました'
    else
      flash.now[:error] = 'コメントが作成できませんでした'
      render :new
    end
  end
  
  private
    
    def comment_params
      params.require(:comment).permit(:content)
    end

end