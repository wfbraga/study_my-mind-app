class ContentsController < ApplicationController
    #skip_berore_action :authenticate_user!
    before_action :set_content, only: [:show, :edit, :update, :destroy]
    def index
      @contents = current_user.contents
    end

    def create
      @content = current_user.contents.build(content_params)

      # o maneira acime é uma forma abreviada de fazer
      # @content_params = Content.new(content_params)
      # @content.user = current_user
      # Isso é possível porque há uma relação no modelo entre User e Content

      if @content.save
        redirect_to contents_path, notice: 'Conteudo criado com suceço!'
      else
        render :new
      end
    end

    def new
      @content = Content.new
    end

    def edit
    end
    
    def show
    end
    
    def update
      
      if @content.update(content_params)
        redirect_to content_path, notice: 'Conteudo Atualizado con suceço'
      else
        render :edit
      end
    end

    def destroy
      @content.destroy
      redirect_to contents_path, notice: 'Conteudo deletado con suceço'
    end

    private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :description)
    end

  end
  