class SavedSearchesController < ApplicationController
  respond_to :html, :js
  
  def index
    @saved_searches = saved_searches.order("name")
  end

  def create
    @saved_search = saved_searches.create(:tag_query => params[:tags])
  end

  def destroy
    @saved_search = saved_searches.find(params[:id])
    @saved_search.destroy
  end

private

  def saved_searches
    CurrentUser.user.saved_searches
  end
end
