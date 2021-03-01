class ContentsController < ApplicationController
    #skip_berore_action :authenticate_user!
    def index
      @contents = current_user.contents
    end

    def new
      @content = Content.new
    end
  end
  