class SearchController < ApplicationController
  def index
    @records = Searchkick.search(params[:q]).results
  end
end
