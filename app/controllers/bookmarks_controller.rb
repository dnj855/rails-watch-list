class BookmarksController < ApplicationController
  before_action :set_list, only: :create

  def create
    @bookmark = Bookmark.new(bookmark_param)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @review = Review.new
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(list), status: :see_other
  end

  private

  def bookmark_param
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
