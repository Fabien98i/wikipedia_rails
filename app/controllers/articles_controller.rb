class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :autorize_autotification, only: [:new, :create, :edit, :destroy, :update]
  # before_action :redirect_user_article, only: [ :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = @current_user
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    # respond_to do |format|
    if @article.update(article_params)
        @content = Content.new
        @content.article_id = @article.id
        @content.content = @article.content
        logger.info "Coucou" 
        logger.info  @content.article_id.to_s
        logger.info  @content.content.to_s
        @content.save
        # format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        # format.json { render :show, status: :ok, location: @article }
      # else
      #   format.html { render :edit }
      #   format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    # end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # def redirect_user_article
    #   if @current_user.id == @article.user.id
    #     redirect_to action: 'show', id: @current_user.id
    #   end 
    # end

    def autorize_autotification
      if @current_user.nil?
        redirect_to sign_in_path
      end
    end

    
    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
    
end
