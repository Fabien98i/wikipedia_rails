class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  # GET /contents
  # GET /contents.json
  def index

    @contents = Content.all
    #logger.info "contents ::::: "+ params[:id].to_s
    #logger.info articles.title.to_s
    # if @articles.id == @contents.article_id
    #   @contents = Content.all
    #   redirect_to index_path
    #   else
    #     redirect_to new_path, notice: 'Contenu indisponible'
    # end
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
    # @articles = Article.all
    # if @articles.id == @contents.article_id
    #   redirect_to index_path
    #   else
    #     redirect_to new_path, notice: 'Contenu indisponible'
    # end

  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)
    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      # @article_id = params[:id]
      # @contents = Content.all
      # logger.info "ID article dans article: " + @article_id.to_s
      # logger.info "ID article dans article: " + @contents.to_s
      #  for content in @content
      #   logger.info "ID ARTICLE dans contenu" + content.id_article.to_s
        
      #   if content.id_article == @article_id
          @content = Content.where(article_id: params[:id])
      #   end
      # end
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:content, :article_id)
    end

    def take_id_article
      
    end
end
