class SearchController < ApplicationController
    def index
        if params[:query].present?
          @articles = Article.where("content LIKE ? OR users.username LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%").joins(:user)
        else
          @articles = []
        end
    end
end
